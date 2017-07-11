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

class Peer {
    private static let moduleName = "peers"
    
    /// Gets a list of all peers matching the given query.
    ///
    /// - Parameters:
    ///   - query: The query to filter peers
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-peers-list
    open class func getPeersList(query: [String : String],
                                 callback: @escaping Callback) {
        Api.request(module: moduleName,
                    submodule: nil,
                    method: .get,
                    query: query,
                    callback: callback)
    }
    
    /// Gets data about a specific peer.
    ///
    /// - Parameters:
    ///   - ip: The ip address of the peer.
    ///   - port: The port the peer is using to communicate with the Lisk network
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-peer
    open class func getPeer(ip: String,
                            port: Int16,
                            callback: @escaping Callback) {
        let query = [
            "ip": ip,
            "port": String(port)
        ]
        
        Api.request(module: moduleName,
                    submodule: "get",
                    method: .get,
                    query: query,
                    callback: callback)
    }
    
    /// Gets the version and build time of the peer the network is currently connected to (see `Api.host`)
    ///
    /// - Parameter callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-peer-version-build-time
    open class func getPeerVersion(callback: @escaping Callback) {
        Api.request(module: moduleName,
                    submodule: "version",
                    method: .get,
                    callback: callback)
    }
    
    /// Gets the number of connected peers.
    ///
    /// - Parameter callback: The function that will be called with information about the request
    open class func getPeersCount(callback: @escaping Callback) {
        Api.request(module: moduleName,
                    submodule: "count",
                    method: .get,
                    callback: callback)
    }
    
}
