import XCTest
import Foundation

@testable import Okapi

final class OkapiTests: XCTestCase {
    func testMetadata() throws {
        let request = Okapi_Metadata_MetadataRequest();
        let response = try Metadata.getMetadata(request: request);
        assert(response.versionMajor != 0 || response.versionMinor != 0);
    }
    
    func testGenerateKey() throws {
        var request = Okapi_Keys_V1_GenerateKeyRequest();
        request.keyType = Okapi_Keys_V1_KeyType.ed25519;
        request.seed = Data(_: [1, 2, 3]);

        let response = try DidKey.generate(request: request);
        _ = assertValidKeyGenerated(response: response);
    }

    func testGenerateKeyNoSeed() throws {
        var request = Okapi_Keys_V1_GenerateKeyRequest();
        request.keyType = Okapi_Keys_V1_KeyType.ed25519;

        let response = try DidKey.generate(request: request);
        _ = assertValidKeyGenerated(response: response);
    }

    func testResolveKey() throws {
        var request = Okapi_Keys_V1_ResolveRequest();
        request.did = "did:key:z6Mkt6QT8FPajKXDrtMefkjxRQENd9wFzKkDFomdQAVFzpzm#z6LSfDq6DuofPeZUqNEmdZsxpvfHvSoUXGEWFhw7JHk4cynN";

        _ = try DidKey.resolve(request: request);
    }

    func testGenerateKeyThrowsInvalidKeyType() throws {
        // Not needed since static typing prevents invalid coalesce.
//            var request = Okapi_Keys_V1_GenerateKeyRequest();
//            request.keyType = Okapi_Keys_V1_KeyType(rawValue: -1) ?? <#default value#>;
    }

    func testGenerateKeyFromSeed1() throws {
        let keyType = Okapi_Keys_V1_KeyType.ed25519;
        let keyTypeName = "Ed25519";
        let seed = "4f66b355aa7b0980ff901f2295b9c562ac3061be4df86703eb28c612faae6578";
        let answer = "5435c3c2e18a56af75cf153aabbfff8cb0d4abcfc2e5cbb110281dfb57de1531";
        try generateKeyFromArguments(keyType: keyType, keyTypeName: keyTypeName, seed: seed, answer: answer);
    }

    func testGenerateKeyFromSeed2() throws {
        let keyType = Okapi_Keys_V1_KeyType.x25519;
        let keyTypeName = "X25519";
        let seed = "9b29d42b38ddd52ed39c0ff70b39572a6eb9b3cac201918dc6d6a84b4c88d2a5";
        let answer = "21206faaf739899ca30df9d0a081416a1022f72e01f5c88759083e5833fccf21";
        try generateKeyFromArguments(keyType: keyType, keyTypeName: keyTypeName, seed: seed, answer: answer);
    }

    func generateKeyFromArguments(keyType: Okapi_Keys_V1_KeyType, keyTypeName: String,
                                  seed: String, answer: String) throws {
        var request = Okapi_Keys_V1_GenerateKeyRequest();
        request.keyType = keyType;
        request.seed = Data(fromHexEncodedString: seed) ?? Data();

        let answerData = Data(fromHexEncodedString: answer) ?? Data();

        let response = try DidKey.generate(request: request);
        let publicKey = assertValidKeyGenerated(response: response, crv: keyTypeName);
        let answerString = answerData.base64EncodedString();
        assert(answerString == publicKey);
    }

    func assertValidKeyGenerated(response: Okapi_Keys_V1_GenerateKeyResponse, crv: String = "Ed25519") -> String {
        assert(response.key[0].crv == crv);
        let x: Data = Data(base64Encoded: base64_padding(s: response.key[0].x), options: [Data.Base64DecodingOptions.ignoreUnknownCharacters]) ?? Data();
        let y: Data = Data(base64Encoded: base64_padding(s: response.key[0].y), options: [Data.Base64DecodingOptions.ignoreUnknownCharacters]) ?? Data();
        var publicKey = Data();
        publicKey.append(x);
        publicKey.append(y);
        assert(publicKey.count == 32);

        let response64: Data = Data(base64Encoded: base64_padding(s: response.key[0].d), options: [Data.Base64DecodingOptions.ignoreUnknownCharacters]) ?? Data();
        assert(response64.count == 32);

        return publicKey.base64EncodedString();
    }

    func base64_padding(s: String) -> String {
        let stringShort = s.count % 4;
        let sNew = s.replacingOccurrences(of: "-", with: "+").replacingOccurrences(of: "_", with: "/")
        if stringShort == 2 {
            return sNew + "==";
        } else if stringShort == 3 {
            return sNew + "=";
        }
        return sNew;
    }
}

extension Data {

    init?(fromHexEncodedString string: String) {

        // Convert 0 ... 9, a ... f, A ...F to their decimal value,
        // return nil for all other input characters
        func decodeNibble(u: UInt16) -> UInt8? {
            switch (u) {
            case 0x30...0x39:
                return UInt8(u - 0x30)
            case 0x41...0x46:
                return UInt8(u - 0x41 + 10)
            case 0x61...0x66:
                return UInt8(u - 0x61 + 10)
            default:
                return nil
            }
        }

        self.init(capacity: string.utf16.count / 2)
        var even = true
        var byte: UInt8 = 0
        for c in string.utf16 {
            guard let val = decodeNibble(u: c) else {
                return nil
            }
            if even {
                byte = val << 4
            } else {
                byte += val
                self.append(byte)
            }
            even = !even
        }
        guard even else {
            return nil
        }
    }
}
