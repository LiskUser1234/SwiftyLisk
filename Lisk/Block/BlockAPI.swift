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

class BlockAPI {
    private static let moduleName = "blocks"
    
    /// Gets all blocks matching the given query.
    ///
    /// - Parameters:
    ///   - query: The query to filter blocks.
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
  /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-blocks
    open class func getAll(query: [String : String],
                       callback: @escaping Callback) {
        Api.request(module: moduleName,
                    submodule: nil,
                    method: .get,
                    query: query,
                    callback: callback)
    }
    
    /// Gets the block with the given id.
    ///
    /// - Parameters:
    ///   - id: The id of the block to retrieve
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-block
    open class func get(id: String,
                    callback: @escaping Callback) {
        let data = [
            "id": id
        ]
        
        Api.request(module: moduleName,
                    submodule: "get",
                    method: .get,
                    query: data,
                    callback: callback)
    }
    
    /// Gets the fee for funds transfer transactions.
    ///
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
 /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-blockchain-fee
    open class func getBlockchainFee(callback: @escaping Callback) {
        Api.request(module: moduleName,
                    submodule: "getFee",
                    method: .get,
                    callback: callback)
    }
    
    /// Get the fee for all possible transaction types on the Lisk network.
    ///
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
  /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-blockchain-fees-schedule
    open class func getBlockchainFees(callback: @escaping Callback) {
        Api.request(module: moduleName,
                    submodule: "getFees",
                    method: .get,
                    callback: callback)
    }
    
    /// Gets the reward for the next block that will be added to the Lisk blockchain.
    ///
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
   /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-blockchain-reward-schedule
    open class func getBlockReward(callback: @escaping Callback) {
        Api.request(module: moduleName,
                    submodule: "getReward",
                    method: .get,
                    callback: callback)
    }
    
    /// Gets the current supply of Lisks.
    ///
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
 /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-supply-of-available-lisk
    open class func getLisksSupply(callback: @escaping Callback) {
        Api.request(module: moduleName,
                    submodule: "getSupply",
                    method: .get,
                    callback: callback)
    }
    
    /// Gets the height of the current peer's copy of the Lisk blockchain.
    ///
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
  /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-blockchain-height
    open class func getBlockchainHeight(callback: @escaping Callback) {
        Api.request(module: moduleName,
                    submodule: "getHeight",
                    method: .get,
                    callback: callback)
    }
    
    /// Gets the status of the Lisk blockchain, which includes the blockchain's height, tx fee, milestone, reward and supply.
    ///
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
  /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#gets-status-of-height-fee-milestone-blockreward-and-supply
    open class func getStatus(callback: @escaping Callback) {
        Api.request(module: moduleName,
                    submodule: "getStatus",
                    method: .get,
                    callback: callback)
    }
    
    /// Gets the nethash of the blockchain on a client.
    ///
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
   /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-blockchain-nethash
    open class func getNetHash(callback: @escaping Callback) {
        Api.request(module: moduleName,
                    submodule: "getNethash",
                    method: .get,
                    callback: callback)
    }
    
    /// Gets the next milestone of the Lisk blockchain.
    ///
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-blockchain-milestone
    open class func getMilestone(callback: @escaping Callback) {
        Api.request(module: moduleName,
                    submodule: "getMilestone",
                    method: .get,
                    callback: callback)
    }
    
}
