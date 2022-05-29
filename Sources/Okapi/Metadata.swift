import OkapiNative

public struct Metadata {
    public static func getMetadata(request: Okapi_Metadata_MetadataRequest) throws -> Okapi_Metadata_MetadataResponse {
        let response: Okapi_Metadata_MetadataResponse = try Ffi.nativeCall(request: request,
                nativeFunction: { (requestBuffer, responseBufferPtr, errorBufferPtr) in
                    okapi_metadata(requestBuffer, responseBufferPtr, errorBufferPtr)
                });
        return response;
    }
}
