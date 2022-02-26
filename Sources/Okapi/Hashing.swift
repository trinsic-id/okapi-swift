import OkapiNative

public struct Hashing {
    public static func Blake3Hash(request: Okapi_Hashing_V1_Blake3HashRequest) throws -> Okapi_Hashing_V1_Blake3HashResponse {
        let response: Okapi_Hashing_V1_Blake3HashResponse = try Ffi.nativeCall(request: request,
                nativeFunction: { (requestBuffer, responseBufferPtr, errorBufferPtr) in
                    blake3_hash(requestBuffer, responseBufferPtr, errorBufferPtr)
                });
        return response;
    }

    public static func Blake3KeyedHash(request: Okapi_Hashing_V1_Blake3KeyedHashRequest) throws -> Okapi_Hashing_V1_Blake3KeyedHashResponse {
        let response: Okapi_Hashing_V1_Blake3KeyedHashResponse = try Ffi.nativeCall(request: request,
                nativeFunction: { (requestBuffer, responseBufferPtr, errorBufferPtr) in
                    blake3_keyed_hash(requestBuffer, responseBufferPtr, errorBufferPtr)
                });
        return response;
    }

    public static func Blake3DeriveKey(request: Okapi_Hashing_V1_Blake3DeriveKeyRequest) throws -> Okapi_Hashing_V1_Blake3DeriveKeyResponse {
        let response: Okapi_Hashing_V1_Blake3DeriveKeyResponse = try Ffi.nativeCall(request: request,
                nativeFunction: { (requestBuffer, responseBufferPtr, errorBufferPtr) in
                    blake3_derive_key(requestBuffer, responseBufferPtr, errorBufferPtr)
                });
        return response;
    }

    public static func SHA256Hash(request: Okapi_Hashing_V1_SHA256HashRequest) throws -> Okapi_Hashing_V1_SHA256HashResponse {
        let response: Okapi_Hashing_V1_SHA256HashResponse = try Ffi.nativeCall(request: request,
                nativeFunction: { (requestBuffer, responseBufferPtr, errorBufferPtr) in
                    sha256_hash(requestBuffer, responseBufferPtr, errorBufferPtr)
                });
        return response;
    }
}
