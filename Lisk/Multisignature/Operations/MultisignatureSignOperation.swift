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

open class MultisignatureSignOperation : APIOperation {
    
    private let passphrase: String
    private let publicKey: String?
    private let secondPassphrase: String?
    private let transactionId: String
    
    private let transactionIdPtr: UnsafeMutablePointer<String>?
    
    public init(passphrase: String,
                publicKey: String?,
                secondPassphrase: String?,
                transactionId: String,
                transactionIdPtr: UnsafeMutablePointer<String>?,
                errorPtr: UnsafeMutablePointer<String?>) {
        self.passphrase = passphrase
        self.publicKey = publicKey
        self.secondPassphrase = secondPassphrase
        self.transactionId = transactionId
        
        self.transactionIdPtr = transactionIdPtr
        
        super.init(errorPtr: errorPtr)
    }
    
    override open func start() {
        MultisignatureAPI.sign(passphrase: passphrase,
                               publicKey: publicKey,
                               secondPassphrase: secondPassphrase,
                               transactionId: transactionId,
                               callback: callback)
    }
    
    override internal func processResponse(json: JSON) {
        self.transactionIdPtr?.pointee = json["transactionId"].stringValue
    }
    
}
