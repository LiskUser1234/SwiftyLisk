/*
The MIT License
 
 Copyright (C) 2017  LiskUser1234
 - Github: https://github.com/liskuser1234
 
 Please vote LiskUser1234 for delegate to support this project.
 
 For donations:
 - Lisk: 6137947831033853925L
 - Bitcoin: 1NCTZwBJF7ZFpwPeQKiSgci9r2pQV3G7RG
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

import Foundation

class LoaderAPI {
    private static let moduleName = "loader"
    
    /// Get the status of the blockchain
    ///
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-loading-status
    open class func getLoadingStatus(callback: @escaping Callback) {
        Api.request(module: moduleName,
                    submodule: "status",
                    method: .get,
                    callback: callback)
    }
 
    /// Get the synchronisation status of the client
    ///
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-synchronization-status
    open class func getSynchronisationStatus(callback: @escaping Callback) {
        Api.request(module: moduleName,
                    submodule: "status/sync",
                    method: .get,
                    callback: callback)
    }
    
    /// Checks whether the blockchain is currently synced with the network
    ///
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-block-receipt-status
    open class func ping(callback: @escaping Callback) {
        Api.request(module: moduleName,
                    submodule: "statu/ping",
                    method: .get,
                    callback: callback)
    }
    
}
