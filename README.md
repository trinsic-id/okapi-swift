# okapi-swift
Swift bindings for Okapi compatible with swift package manager

### Compiling / updating proto files
* Execute the `generate.bash` at the console.

### Updating the xcframework
* Download the latest `okapi.xcframework-X.Y.0.zip` from `https://github.com/trinsic-id/okapi/releases`
* execute the following command: `swift package compute-checksum okapi.xcframework-1.6.0.zip`
* Output is something like: `c63d6e49b008473561420eb1b28333c727c6ac82293965c307e6b398621d57ef`
* Copy the output to the `checksum` in `Package.swift`
