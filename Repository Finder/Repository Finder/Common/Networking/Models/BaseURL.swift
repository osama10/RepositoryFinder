//
//  BaseURL.swift
//  Repository Finder
//
//  Created by Osama Bin Bashir on 08/12/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

public class BaseURL: NSObject, NSCoding {
    let scheme: String
    let host: String
    let port: Int?
    
    public init(scheme: String, host: String, port: Int? = nil) {
        self.scheme = scheme
        self.host = host
        self.port = port
    }
    
    public required init?(coder aDecoder: NSCoder) {
        scheme = aDecoder.decodeObject(forKey: "scheme") as! String
        host = aDecoder.decodeObject(forKey: "host") as! String
        port = aDecoder.decodeObject(forKey: "port") as? Int
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(scheme, forKey: "scheme")
        aCoder.encode(host, forKey: "host")
        aCoder.encode(port, forKey: "port")
    }
    
    public func url() -> URL {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.port = port
        
        return components.url!
    }
}

extension BaseURL {
    
    public static func == (lhs: BaseURL, rhs: BaseURL) -> Bool {
        return lhs.host.lowercased() == rhs.host.lowercased()
    }
}
