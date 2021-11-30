import OkapiNative

public struct LdProofs {
    public static func createProof(request: Okapi_Proofs_V1_CreateProofRequest) throws -> Okapi_Proofs_V1_CreateProofResponse {
        let response: Okapi_Proofs_V1_CreateProofResponse = try Ffi.nativeCall(request: request,
                nativeFunction: { (requestBuffer, responseBufferPtr, errorBufferPtr) in
                    ldproofs_create_proof(requestBuffer, responseBufferPtr, errorBufferPtr)
                });
        return response;
    }

    public static func verifyProof(request: Okapi_Proofs_V1_VerifyProofRequest) throws -> Okapi_Proofs_V1_VerifyProofResponse {
        let response: Okapi_Proofs_V1_VerifyProofResponse = try Ffi.nativeCall(request: request,
                nativeFunction: { (requestBuffer, responseBufferPtr, errorBufferPtr) in
                    ldproofs_verify_proof(requestBuffer, responseBufferPtr, errorBufferPtr)
                });
        return response;
    }
}
