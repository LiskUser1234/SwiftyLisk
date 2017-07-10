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

class TransactionAPI {
    private static let moduleName = "transactions"
    
    /// Gets all transactions matching the given query. Only transactions already included in a block will be considered.
    ///
    /// - Parameters:
    ///   - query: The query used to filter transactions
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-list-of-transactions
    open class func getAll(query: [String : String],
                       callback: @escaping Callback) {
        Api.request(module: moduleName,
                    submodule: nil,
                    method: .get,
                    query: query,
                    callback: callback)
    }
    
    /// Gets all unconfirmed transactions.
    ///
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-list-of-unconfirmed-transactions
    open class func getAllUnconfirmed(callback: @escaping Callback) {
        Api.request(module: moduleName,
                    submodule: "unconfirmed",
                    method: .get,
                    callback: callback)
    }
    
    /// Gets all queued transactions.
    ///
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-list-of-queued-transactions
    open class func getAllQueued(callback: @escaping Callback) {
        Api.request(module: moduleName,
                    submodule: "queued",
                    method: .get,
                    callback: callback)
    }
    
    /// Gets the transaction with the given id. Use `getUnconfirmed` or `getQueued` if the transaction still has not been included in a block.
    ///
    /// - Parameters:
    ///   - transactionId: The id of the transaction to retrieve
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-transaction
    open class func get(transactionId: String,
                    callback: @escaping Callback) {
        let data = [
            "id": transactionId
        ]
        
        Api.request(module: moduleName,
                    submodule: "get",
                    method: .get,
                    query: data,
                    callback: callback)
    }
    
    /// Gets an unconfirmed transaction with the given id. Use `get` if the transaction already is in a block or `getQueued` if the transaction is being processed.
    ///
    /// - Parameters:
    ///   - transactionId: The id of the transaction to retrieve
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-unconfirmed-transaction
    open class func getUnconfirmed(transactionId: String,
                               callback: @escaping Callback) {
        let data = [
            "id": transactionId
        ]
        
        Api.request(module: moduleName,
                    submodule: "unconfirmed/get",
                    method: .get,
                    query: data,
                    callback: callback)
    }
    
    /// Gets a queued transaction with the given id. Use `get` if the transaction already is in a block or `getUnconfirmed` if the transaction is still waiting to be added in a block.
    ///
    /// - Parameters:
    ///   - transactionId: The id of the transaction to retrive
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-specific-queued-transaction
    open class func getQueued(transactionId: String,
                          callback: @escaping Callback) {
        let data = [
            "id": transactionId
        ]
        
        Api.request(module: moduleName,
                    submodule: "queued/get",
                    method: .get,
                    query: data,
                    callback: callback)
    }
    
    /// Propagate a transaction on the Lisk network
    ///
    /// - Parameters:
    ///   - passphrase: The passphrase of the sending address
    ///   - amount: The amount to send, where LSK 1 = 100_000_000 units
    ///   - recipientId: The address to which `amount` will be sent to
    ///   - secondPassphrase: Optional: the second passphrase of the sending address
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#send-transaction
    open class func send(passphrase: String,
                     amount: Double,
                     recipientId: String,
                     secondPassphrase: String?,
                     callback: @escaping Callback) {
        var data: [String : Any] = [
            "secret": passphrase,
            "recipientId": recipientId,
            "amount": amount
        ]
        
        if let secondPassphrase = secondPassphrase {
            data["secondSecret"] = secondPassphrase
        }
        
        Api.request(module: moduleName,
                    submodule: nil,
                    method: .put,
                    json: data,
                    callback: callback)
    }
    
}
