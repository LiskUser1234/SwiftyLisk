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

class SignatureAPI {
    private static let moduleName = "signatures"
    
    /// Gets the fee to register a second signature.
    ///
    /// - Parameter callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#get-signature-fees
    open class func getFee(callback: @escaping Callback) {
        Api.request(module: moduleName,
                    submodule: "fee",
                    method: .get,
                    callback: callback)
    }
    
    /// Adds a second signature to a standard account
    ///
    /// - Parameters:
    ///   - secret: The passphrase from which the address is derived
    ///   - secondSecret: The second passphrase to add to the address derived from `secret`
    ///   - publicKey: Optional: the expected public key associated with the account derived from `secret`
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#add-second-signature
    open class func addSecondSignature(secret: String,
                                       secondSecret: String,
                                       publicKey: String?,
                                       callback: @escaping Callback) {
        var query = [
            "secret": secret,
            "secondSecret": secondSecret
        ]
        
        if let publicKey = publicKey {
            query["publicKey"] = publicKey
        }
        
        Api.request(module: moduleName,
                    submodule: nil,
                    method: .put,
                    query: query,
                    callback: callback)
    }
    
    /// Adds a second signature to a multisig account
    ///
    /// - Parameters:
    ///   - secret: The passphrase from which the address is derived
    ///   - secondSecret: The second passphrase to add to the address derived from `secret`
    ///   - publicKey: Optional: the expected public key associated with the account derived from `secret`
    ///   - callback: The function that will be called with information about the request
    ///
    /// For more information about the response see
    /// https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference#add-second-signature
    open class func addMultisigSecondSignature(secret: String,
                                               secondSecret: String,
                                               publicKey: String?,
                                               callback: @escaping Callback) {
        var query = [
            "secret": secret,
            "secondSecret": secondSecret
        ]
        
        if let publicKey = publicKey {
            query["multisigAccountPublicKey"] = publicKey
        }
        
        Api.request(module: moduleName,
                    submodule: nil,
                    method: .put,
                    query: query,
                    callback: callback)
    }
    
}
