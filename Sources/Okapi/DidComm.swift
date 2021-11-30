import OkapiNative

public struct DidComm {
    public static func pack(request: Okapi_Transport_V1_PackRequest) throws -> Okapi_Transport_V1_PackResponse {
        let response: Okapi_Transport_V1_PackResponse = try Ffi.nativeCall(request: request,
                nativeFunction: { (requestBuffer, responseBufferPtr, errorBufferPtr) in
                    didcomm_pack(requestBuffer, responseBufferPtr, errorBufferPtr)
                });
        return response;
    }

    public static func unpack(request: Okapi_Transport_V1_UnpackRequest) throws -> Okapi_Transport_V1_UnpackResponse {
        let response: Okapi_Transport_V1_UnpackResponse = try Ffi.nativeCall(request: request,
                nativeFunction: { (requestBuffer, responseBufferPtr, errorBufferPtr) in
                    didcomm_unpack(requestBuffer, responseBufferPtr, errorBufferPtr)
                });
        return response;
    }

    public static func sign(request: Okapi_Transport_V1_SignRequest) throws -> Okapi_Transport_V1_SignResponse {
        let response: Okapi_Transport_V1_SignResponse = try Ffi.nativeCall(request: request,
                nativeFunction: { (requestBuffer, responseBufferPtr, errorBufferPtr) in
                    didcomm_sign(requestBuffer, responseBufferPtr, errorBufferPtr)
                });
        return response;
    }

    public static func verify(request: Okapi_Transport_V1_VerifyRequest) throws -> Okapi_Transport_V1_VerifyResponse {
        let response: Okapi_Transport_V1_VerifyResponse = try Ffi.nativeCall(request: request,
                nativeFunction: { (requestBuffer, responseBufferPtr, errorBufferPtr) in
                    didcomm_verify(requestBuffer, responseBufferPtr, errorBufferPtr)
                });
        return response;
    }
}
