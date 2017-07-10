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
import SwiftyJSON

class DelegateAPI {
    private static let moduleName = "delegates"
    
    /// Turns the account derived from the given `passphrase` into a delegate with the given `username`
    ///
    /// - Parameters:
    ///   - passphrase: The passphrase whose derived address will become a delegate
    ///   - secondPassphrase: Optional: the second passphrase of the address that will become a delegate. Necessary to sign the delegate registration transaction
    ///   - username: The username that will be associated with the addresss to turn into a delegate
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#enable-delegate-on-account
    open class func enableDelegate(passphrase: String,
                               secondPassphrase: String?,
                               username: String,
                               callback: @escaping Callback) {
        var data = [
            "secret": passphrase,
            "username": username
        ]
        
        if let secondPassphrase = secondPassphrase {
            data["secondSecretKey"] = secondPassphrase
        }
        
        Api.request(module: moduleName,
                    submodule: nil,
                    method: .put,
                    json: data,
                    callback: callback)
    }
    
    /// Gets data about all delegates matching the given query.
    ///
    /// - Parameters:
    ///   - query: The query to filter delegates
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-delegates-list
    open class func getDelegates(query: [String : String],
                             callback: @escaping Callback) {
        Api.request(module: moduleName,
                    submodule: nil,
                    method: .get,
                    query: query,
                    callback: callback)
    }
    
    /// Gets data about a delegate with the given username
    ///
    /// - Parameters:
    ///   - username: The username of the delegate to retrieve
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-delegate
    open class func getDelegate(username: String,
                            callback: @escaping Callback) {
        let data = [
            "username": username
        ]
        
        Api.request(module: moduleName,
                    submodule: "get",
                    method: .get,
                    query: data,
                    callback: callback)
    }
    
    /// Gets data about a delegate with the given public key
    ///
    /// - Parameters:
    ///   - publicKey: The public key of the delegate to retrieve
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-delegate
    open class func getDelegate(publicKey: String,
                            callback: @escaping Callback) {
        let data = [
            "publicKey": publicKey
        ]
        
        Api.request(module: moduleName,
                    submodule: "get",
                    method: .get,
                    query: data,
                    callback: callback)
    }
    
    /// Gets data about all delegates whose username fuzzy-matches the given string (`partialUsername`)
    ///
    /// - Parameters:
    ///   - partialUsername: Part of the username of the delegate to retrieve
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#search-for-delegates
    open class func search(partialUsername: String,
                       callback: @escaping Callback) {
        Api.request(module: moduleName,
                    submodule: "search",
                    method: .get,
                    callback: callback)
    }
    
    /// Gets the total number of registered delegates.
    ///
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-delegates-count
    open class func getDelegatesCount(callback: @escaping Callback) {
        Api.request(module: moduleName,
                    submodule: "count",
                    method: .get,
                    callback: callback)
    }
    
    /// Gets all votes casted by an account. Identical to AccountAPI.getDelegates
    ///
    /// - Parameters:
    ///   - address: The address whose votes will be retrieved
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-votes-of-account
    open class func getVotes(address: String,
                         callback: @escaping Callback) {
        let data = [
            "address": address
        ]
        
        Api.request(module: "accounts",
                    submodule: "delegates",
                    method: .get,
                    query: data,
                    callback: callback)
    }
    
    /// Gets the voters of the given public key.
    ///
    /// - Parameters:
    ///   - publicKey: The public key whose votes will be retrieved
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-voters
    open class func getVoters(publicKey: String,
                          callback: @escaping Callback) {
        let data = [
            "publicKey": publicKey
        ]
        
        Api.request(module: moduleName,
                    submodule: "voters",
                    method: .get,
                    query: data,
                    callback: callback)
    }
    
    /// Enable forging on the delegate matching the given passphrase
    ///
    /// - Parameters:
    ///   - passphrase: The passphrase of the delegate for which to enable forging
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#enable-forging-on-delegate
    open class func enableForging(passphrase: String,
                              callback: @escaping Callback) {
        toggleForging(passphrase: passphrase,
                      enable: true,
                      callback: callback)
    }
    
    /// Disable forging on the delegate matching the given passphrase
    ///
    /// - Parameters:
    ///   - passphrase: The passphrase of the delegate for which to disable forging
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#disable-forging-on-delegate
    open class func disableForging(passphrase: String,
                               callback: @escaping Callback) {
        toggleForging(passphrase: passphrase,
                      enable: false,
                      callback: callback)
    }
    
    /// Gets the amount of lisks forged by the given public key.
    ///
    /// - Parameters:
    ///   - publicKey: The public key whose forged amount will be retrieved
    ///   - start: Optional: the minimum timestamp to consider for the search; inclusive
    ///   - end: Optional: the maximum timestamp to consider for the search; inclusive
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-forged-by-account
    open class func getForgedByAccount(publicKey: String,
                                   start: Int64?,
                                   end: Int64?,
                                   callback: @escaping Callback) {
        var data = [
            "generatorPublicKey": publicKey
        ]
        
        if let start = start {
            data["start"] = String(start)
        }
        
        if let end = end {
            data["end"] = String(end)
        }
        
        Api.request(module: moduleName,
                    submodule: "forging/getForgedByAccount",
                    method: .get,
                    query: data,
                    callback: callback)
    }
    
    /// Gets the schedule of forgers for the future blocks.
    ///
    /// - Parameters:
    ///   - limit: The maximum amount of future blocks to get
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-next-forgers
    open class func getNextForgers(limit: Int?,
                               callback: @escaping Callback) {
        var data: [String : String] = [:]
        
        if let limit = limit {
            data["limit"] = String(limit)
        }
        
        Api.request(module: moduleName,
                    submodule: "getNextForgers",
                    method: .get,
                    query: data,
                    callback: callback)
    }
    
    
    // Helper methods
    
    private static func toggleForging(passphrase: String,
                                      enable: Bool,
                                      callback: @escaping Callback) {
        let data = [
            "secret": passphrase
        ]
        
        Api.request(module: moduleName,
                    submodule: (enable ? "forging/enable" : "forging/disable"),
                    method: .get,
                    json: data,
                    callback: callback)
    }
    
}
