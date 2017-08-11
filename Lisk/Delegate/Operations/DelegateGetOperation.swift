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

open class DelegateGetOperation : APIOperation {
    
    private let username: String?
    private let publicKey: String?
    
    private let delegatePtr: UnsafeMutablePointer<JSON>
    
    public init(username: String,
                delegatePtr: UnsafeMutablePointer<JSON>,
                errorPtr: UnsafeMutablePointer<String?>? = nil) {
        self.username = username
        self.publicKey = nil
        
        self.delegatePtr = delegatePtr
        
        super.init(errorPtr: errorPtr)
    }
    
    public init(publicKey: String,
                delegatePtr: UnsafeMutablePointer<JSON>,
                errorPtr: UnsafeMutablePointer<String?>? = nil) {
        self.username = nil
        self.publicKey = publicKey
        
        self.delegatePtr = delegatePtr
        
        super.init(errorPtr: errorPtr)
    }
    
    override open func start() {
        if let username = username {
            DelegateAPI.getDelegate(username: username,
                                    callback: callback)
        } else if let publicKey = publicKey {
            DelegateAPI.getDelegate(publicKey: publicKey,
                                    callback: callback)
        } else {
            print("Cannot get delegate: no parameter specified")
        }
    }
    
    override internal func processResponse(json: JSON) {
        self.delegatePtr.pointee = json["delegate"]
    }
    
}
