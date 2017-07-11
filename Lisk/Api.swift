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

import Alamofire
import Foundation
import SwiftyJSON

/*
 To prevent http request memory leaks:
 - https://stackoverflow.com/questions/32199494/how-to-disable-caching-in-alamofire
 - https://github.com/Alamofire/Alamofire/issues/157
 */

// TOOD: two callbacks, one for success, one for error.
public typealias Callback = (String?, JSON) -> Void

class Api {
    
    static var scheme = "https"
    static var host = "login.lisk.io"
    static var port = 8000 // 8000 for mainnet, 7000 for testnet
    static private var sessionManager: SessionManager? = nil
    
    open class func setup() {
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = nil
        Api.sessionManager = Alamofire.SessionManager(configuration: configuration)
    }
    
    private static var queue = OperationQueue()
    
    // From Alamofire
    public enum HTTPMethod: String {
        case options = "OPTIONS"
        case get     = "GET"
        case head    = "HEAD"
        case post    = "POST"
        case put     = "PUT"
        case patch   = "PATCH"
        case delete  = "DELETE"
        case trace   = "TRACE"
        case connect = "CONNECT"
    }
    
    open class func request(module: String,
                            submodule: String?,
                            method: HTTPMethod,
                            query: [String : String]? = nil,
                            json: [String : Any]? = nil,
                            callback: @escaping Callback) {
        if sessionManager == nil {
            setup()
        }
        
        var urlComponents = URLComponents()
        
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.port = port
        urlComponents.path = "/api/" + module
        
        if let submodule = submodule {
            urlComponents.path += "/" + submodule
        }
        
        if let query = query {
            if query.count > 0 {
                urlComponents.queryItems = [URLQueryItem]()
                
                for (key, value) in query {
                    let queryItem = URLQueryItem(name: key, value: String(value))
                    urlComponents.queryItems?.append(queryItem)
                }
            }
        }
        
        
        let url = urlComponents.url!
        
        var request = URLRequest(url: url)
        
        // Uncomment to enable printing each url.
        //        print(url.absoluteString)
        
        request.httpMethod = method.rawValue
        
        if method == .post {
            if let json = json {
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = try! JSONSerialization.data(withJSONObject: json)
            }
        }
        
        Api.sessionManager?.request(request)
            .responseData {
                response in
                
                if let value = response.result.value {
                    let json = JSON(value)
                    
                    let error = json["error"].string
                    
                    callback(error, json)
                } else {
                    // TODO: callback too?
                    print("Error: \(response.error.debugDescription)")
                    
                    let error = response.error?.localizedDescription
                    let json = JSON([
                        "success": "false",
                        "error": error
                        ])
                    callback(error, json)
                }
        }
        
    }
}
