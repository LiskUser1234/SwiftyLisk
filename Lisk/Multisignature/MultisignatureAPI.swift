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

class MultisignatureAPI {
    private static let moduleName = "multisignatures"
    
    /// Create a multisig account
    ///
    /// - Parameters:
    ///   - passphrase: The passphrase to sign the account's transactions
    ///   - secondPassphrase: Optional: the second passphrase to sign the account's transactions
    ///   - lifetime: The interval of time within which the minimum amount of signatures per transaction must be recieved
    ///   - minimumSignatures: The minimum amount of signatures to approve a transaction
    ///   - keysgroup: Array of public keys that can sign any of the account's tranasactions. Each public key must have a "+" prefix.
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#create-multi-signature-account
    open class func create(passphrase: String,
                       secondPassphrase: String?,
                       lifetime: Int,
                       minimumSignatures: Int,
                       keysgroup: [String],
                       callback: @escaping Callback) {
        var data = [
            "secret": passphrase,
            "lifetime": String(lifetime),
            "min": String(minimumSignatures),
            "keysgroup": keysgroup
        ] as [String : Any]
        
        if let secondPassphrase = secondPassphrase {
            data["secondSecret"] = secondPassphrase
        }
        
        Api.request(module: moduleName,
                    submodule: nil,
                    method: .put,
                    json: data,
                    callback: callback)
    }
    
    /// Gets data relative to the multisig account with the given public key.
    ///
    /// - Parameters:
    ///   - publicKey: The public key of the multisig account for which data will be retrieved
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#create-multi-signature-account
    open class func get(publicKey: String,
                    callback: @escaping Callback) {
        let data = [
            "publicKey" : publicKey
        ]
        
        Api.request(module: moduleName,
                    submodule: "accounts",
                    method: .get,
                    query: data,
                    callback: callback)
    }
    
    /// Signs a pending multisig transaction.
    ///
    /// - Parameters:
    ///   - passphrase: The passphrase of the signer
    ///   - publicKey: Optional: the public key of the signer, to check whether the passphrase's public key matches the expected public key
    ///   - transactionId: The id of the multisig transaction to sign
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#sign-transaction
    open class func sign(passphrase: String,
                     publicKey: String?,
                     transactionId: String,
                     callback: @escaping Callback) {
        var data = [
            "secret": passphrase,
            "transactionId": transactionId,
            
        ]
        
        if let publicKey = publicKey {
            data["publicKey"] = publicKey
        }
        
        Api.request(module: moduleName,
                    submodule: "sign",
                    method: .post,
                    json: data,
                    callback: callback)
    }
    
    /// Gets all pending transactions of the multisig account with the given public key
    ///
    /// - Parameters:
    ///   - publicKey: The public key of the account whose pending transactions will be retrieved
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-pending-multi-signature-transactions
    open class func getPendingTransasctions(publicKey: String,
                                        callback: @escaping Callback) {
        let data = [
            "publicKey": publicKey
        ]
        
        Api.request(module: moduleName,
                    submodule: "pending",
                    method: .get,
                    query: data,
                    callback: callback)
    }
    
}
