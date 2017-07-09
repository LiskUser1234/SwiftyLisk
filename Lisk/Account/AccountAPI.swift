/*
The MIT License
 
 Copyright (C) 2017  LiskUser1234
 - Github: https://github.com/liskuser1234
 
 Please vote LiskUser1234 for delegate to support this project.
 
 For donations:
 - Bitcoin: 1NCTZwBJF7ZFpwPeQKiSgci9r2pQV3G7RG
 - Lisk: 13571903755597459962L
 
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

open class AccountAPI {
    private static let moduleName = "accounts"
    
    /// Open a Lisk Account.
    ///
    /// - Parameters:
    ///   - secret: The passphrase to unlock the account
    ///   - callback: The function that will be called with information about the request.
    ///
    /// For information about the response see 
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#open-account
    open class func open(secret: String,
                     callback: @escaping Callback) {
        let data = [
            "secret": secret
        ]
        
        Api.request(module: moduleName,
                    submodule: "open",
                    method: .post,
                    json: data,
                    callback: callback)
    }
    
    /// Get the balance of an address.
    ///
    /// - Parameters:
    ///   - address: The address whose balance will be returned
    ///   - callback: The function that will be called with information about the request
    ///
    /// For information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-balance
    open class func getBalance(address: String,
                           callback: @escaping Callback) {
        let data = [
            "address": address
        ]
        
        Api.request(module: moduleName,
                    submodule: "getBalance",
                    method: .get,
                    query: data,
                    callback: callback)
    }
    
    /// Get the public key of an address.
    ///
    /// - Parameters:
    ///   - address: The address whsoe public key will be returned
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-account-public-key
    open class func getPublicKey(address: String,
                             callback: @escaping Callback) {
        let data = [
            "address": address
        ]
        
        Api.request(module: moduleName,
                    submodule: "getPublicKey",
                    method: .get,
                    query: data,
                    callback: callback)
    }
    
    /// Generates and returns the public key for the address derived from the given secret.
    ///
    /// - Parameters:
    ///   - secret: The secret from which the address whose public key will be generated is retrieved from
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#generate-public-key
    open class func generatePublicKey(secret: String,
                                  callback: @escaping Callback) {
        let data = [
            "secret": secret
        ]
        
        Api.request(module: moduleName,
                    submodule: "generatePublicKey",
                    method: .post,
                    json: data,
                    callback: callback)
    }
    
    /// Gets public data about an address.
    ///
    /// - Parameters:
    ///   - address: The address whose data will be returned
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-account
    open class func get(address: String,
                    callback: @escaping Callback) {
        let data = [
            "address": address
        ]
        
        Api.request(module: moduleName,
                    submodule: nil,
                    method: .get,
                    query: data,
                    callback: callback)
    }
    
    /// Gets the voted accounts of the given address
    ///
    /// - Parameters:
    ///   - address: The address whose voted delegates will be returned
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-delegates
    open class func getDelegates(address: String,
                             callback: @escaping Callback) {
        let data = [
            "address": address
        ]
        
        Api.request(module: moduleName,
                    submodule: "delegates",
                    method: .get,
                    query: data,
                    callback: callback)
    }
    
    /// Propagates to the network a vote transaction with the given votes
    ///
    /// - Parameters:
    ///   - passphrase: The passphrase to sign the vote transaction
    ///   - secondPassphrase: Additional, the second passphrase to sign the vote transaction
    ///   - publicKey: The public key of the address casting the votes
    ///   - delegates: An array of public keys with suffix "+" if the vote is added or "-" if the vote is removed
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#put-delegates
    open class func putDelegates(passphrase: String,
                             secondPassphrase: String?,
                             publicKey: String?,
                             delegates: [String],
                             callback: @escaping Callback) {
        var form: [String : Any] = [
            "secret": passphrase,
            "delegates": delegates
        ]
        
        if let secondPassphrase = secondPassphrase {
            form["secondSecret"] = secondPassphrase
        }
        
        if let publicKey = publicKey {
            form["publicKey"] = publicKey
        }
        
        Api.request(module: moduleName,
                    submodule: "delegates",
                    method: .put,
                    json: form,
                    callback: callback)
    }
    
}
