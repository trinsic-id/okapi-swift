import OkapiNative

public struct DidKey {
    public static func generate(request: Okapi_Keys_V1_GenerateKeyRequest) throws -> Okapi_Keys_V1_GenerateKeyResponse {
        let response: Okapi_Keys_V1_GenerateKeyResponse = try Ffi.nativeCall(request: request,
                nativeFunction: { (requestBuffer, responseBufferPtr, errorBufferPtr) in
                    didkey_generate(requestBuffer, responseBufferPtr, errorBufferPtr)
                });
        return response;
    }

    public static func resolve(request: Okapi_Keys_V1_ResolveRequest) throws -> Okapi_Keys_V1_ResolveResponse {
        let response: Okapi_Keys_V1_ResolveResponse = try Ffi.nativeCall(request: request,
                nativeFunction: { (requestBuffer, responseBufferPtr, errorBufferPtr) in
                    didkey_resolve(requestBuffer, responseBufferPtr, errorBufferPtr)
                });
        return response;
    }
}
