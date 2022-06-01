import OkapiNative

public struct Oberon {
    public static func createKey(request: Okapi_Security_V1_CreateOberonKeyRequest) throws -> Okapi_Security_V1_CreateOberonKeyResponse {
        let response: Okapi_Security_V1_CreateOberonKeyResponse = try Ffi.nativeCall(request: request,
                nativeFunction: { (requestBuffer, responseBufferPtr, errorBufferPtr) in
                    oberon_create_key(requestBuffer, responseBufferPtr, errorBufferPtr)
                });
        return response;
    }

    public static func createProof(request: Okapi_Security_V1_CreateOberonProofRequest) throws -> Okapi_Security_V1_CreateOberonProofResponse {
        let response: Okapi_Security_V1_CreateOberonProofResponse = try Ffi.nativeCall(request: request,
                nativeFunction: { (requestBuffer, responseBufferPtr, errorBufferPtr) in
                    oberon_create_proof(requestBuffer, responseBufferPtr, errorBufferPtr)
                });
        return response;
    }

    public static func createToken(request: Okapi_Security_V1_CreateOberonTokenRequest) throws -> Okapi_Security_V1_CreateOberonTokenResponse {
        let response: Okapi_Security_V1_CreateOberonTokenResponse = try Ffi.nativeCall(request: request,
                nativeFunction: { (requestBuffer, responseBufferPtr, errorBufferPtr) in
                    oberon_create_token(requestBuffer, responseBufferPtr, errorBufferPtr)
                });
        return response;
    }

    public static func blindToken(request: Okapi_Security_V1_BlindOberonTokenRequest) throws -> Okapi_Security_V1_BlindOberonTokenResponse {
        let response: Okapi_Security_V1_BlindOberonTokenResponse = try Ffi.nativeCall(request: request,
                nativeFunction: { (requestBuffer, responseBufferPtr, errorBufferPtr) in
                    oberon_blind_token(requestBuffer, responseBufferPtr, errorBufferPtr)
                });
        return response;
    }

    public static func unblindToken(request: Okapi_Security_V1_UnBlindOberonTokenRequest) throws -> Okapi_Security_V1_UnBlindOberonTokenResponse {
        let response: Okapi_Security_V1_UnBlindOberonTokenResponse = try Ffi.nativeCall(request: request,
                nativeFunction: { (requestBuffer, responseBufferPtr, errorBufferPtr) in
                    oberon_unblind_token(requestBuffer, responseBufferPtr, errorBufferPtr)
                });
        return response;
    }

    public static func verifyProof(request: Okapi_Security_V1_VerifyOberonProofRequest) throws -> Okapi_Security_V1_VerifyOberonProofResponse {
        let response: Okapi_Security_V1_VerifyOberonProofResponse = try Ffi.nativeCall(request: request,
                nativeFunction: { (requestBuffer, responseBufferPtr, errorBufferPtr) in
                    oberon_verify_proof(requestBuffer, responseBufferPtr, errorBufferPtr)
                });
        return response;
    }
}
