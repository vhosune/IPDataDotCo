//
// Copyright © HO-SUNE Vincent. All rights reserved.
//

import Foundation

/// [ipdata.co](https://ipdata.co/)  allows you to lookup the location of any IP address, both IPv4 and IPv6.
///
/// - note: status code in response
/// - **200** successful response
/// - **400** bad ip or bulk with more than 100 ips
/// - **401** missing api-key
/// - **403** quota exceeded or not a valid api-key
///
public struct IPDataDotCo {
    
    public typealias IPString = String
    
    private let settings: Settings
    
    /// init `IPDataDotCo` with `Settings`
    public init(with settings: Settings) {
        self.settings = settings
    }
    
    /// Create a lookup request
    ///
    /// - parameter ip: the ip address to lookup or `nil` if looking up current ip
    /// - parameter fields: a list of fields we want to selectively query or `nil`to query all
    ///
    /// - returns: a `URLRequest` to request against
    ///
    /// - note: the resquest returns a `JSONRootObject`decodable
    ///
    public func lookupRequest(ip ipAddress: IPString? = nil, for fields: [QueryFields]? = nil) -> URLRequest? {
        
        guard var components = URLComponents(string: self.settings.host) else {
            return nil
        }
        
        components.path = "/"
        
        if let ipAddress = ipAddress {
            components.path += ipAddress
        }
        
        var queries = [URLQueryItem(name: "api-key", value: self.settings.apiKey)]
        
        if let fields = fields {
            let allFields = fields.map({ $0.rawValue }).joined(separator: ",")
            let query = URLQueryItem(name: "fields", value: allFields)
            queries.append(query)
        }
        
        components.queryItems = queries
        
        if let url = components.url {
            var request = URLRequest(url: url)
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            return request
        }
        
        return nil
    }
    
    /// Create a lookup request for a field
    ///
    /// - parameter ip: the ip address to lookup or `nil` if looking up current ip
    /// - parameter field: the field to selectively query
    ///
    /// - returns: a `URLRequest` to request against
    ///
    /// - note: this request will need a specific parsing of the result to match what we requested
    ///
    public func lookupRequest(ip ipAddress: IPString? = nil, for field: QueryFields) -> URLRequest? {
        
        guard var components = URLComponents(string: self.settings.host) else {
            return nil
        }
        
        components.path = ""
        
        if let ipAddress = ipAddress {
            components.path += "/" + ipAddress
        }
        
        components.path += "/" + field.rawValue
        
        components.queryItems = [URLQueryItem(name: "api-key", value: self.settings.apiKey)]
        
        if let url = components.url {
            var request = URLRequest(url: url)
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            return request
        }
        
        return nil
    }
    
    /// Create a ulk lookup request for a max of 100 ip
    ///
    /// - parameter ips: list of ip address (truncated at 100 if there is more)
    ///
    /// - returns: a `URLRequest` to request against
    ///
    /// - note: available **only for paid users**
    ///
    public func bulkLookUpRequest(ips ipAddress: [IPString]) -> URLRequest? {
        guard var components = URLComponents(string: self.settings.host) else {
            return nil
        }

        components.path = "/bulk"
        components.queryItems = [URLQueryItem(name: "api-key", value: self.settings.apiKey)]

        // force limit the number of items
        let maxBulk = 100
        let maxIpCount = ipAddress.count > maxBulk ? maxBulk : ipAddress.count
        let ipList = Array(ipAddress[0..<maxIpCount])
        let jsonData = try? JSONEncoder().encode(ipList)
        
        if let url = components.url, let body = jsonData {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = body
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            return request
        }
        
        return nil
    }
    
}
