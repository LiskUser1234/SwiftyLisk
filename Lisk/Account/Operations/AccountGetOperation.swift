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

open class AccountGetOperation : APIOperation {
    
    private let address: String?
    private let publicKey: String?
    
    private let accountPtr: UnsafeMutablePointer<JSON>
    
    public init(address: String,
         accountPtr: UnsafeMutablePointer<JSON>,
         errorPtr: UnsafeMutablePointer<String?>) {
        self.address = address
        self.publicKey = nil
        
        self.accountPtr = accountPtr
        
        super.init(errorPtr: errorPtr)
    }
    
    public init(publicKey: String,
         accountPtr: UnsafeMutablePointer<JSON>,
         errorPtr: UnsafeMutablePointer<String?>) {
        self.address = nil
        self.publicKey = publicKey
        
        self.accountPtr = accountPtr
        
        super.init(errorPtr: errorPtr)
    }
    
    override open func start() {
        if let address = address {
            AccountAPI.get(address: address,
                           callback: callback)
        } else if let publicKey = publicKey {
            AccountAPI.get(publicKey: publicKey,
                           callback: callback)
        }
    }
    
    override internal func processResponse(json: JSON) {
        self.accountPtr.pointee = json["account"]
    }
    
}
