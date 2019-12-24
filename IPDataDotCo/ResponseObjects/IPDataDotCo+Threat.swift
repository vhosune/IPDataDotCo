//
// Copyright © HO-SUNE Vincent. All rights reserved.
//

import Foundation

extension IPDataDotCo {
    
    public struct Threat: Codable {
        
        enum CodingKeys: String, CodingKey {
            case isTor = "is_tor"
            case isProxy = "is_proxy"
            case isAnonymous = "is_anonymous"
            case isKnownAttacker = "is_known_attacker"
            case isKnownAbuser = "is_known_abuser"
            case isThreat = "is_threat"
            case isBogon = "is_bogon"
        }

        /// is `true` if the IP address is associated with a node on the Tor network
        public let isTor: Bool?
        
        /// is `true` if the IP address is a known proxy, includes HTTP/HTTPS/SSL/SOCKS/CONNECT and transparent proxies
        public let isProxy: Bool?
        
        /// is set `true` if either one of `isTor` or `isProxy` is true
        public let isAnonymous: Bool?
        
        /// is `true` if an IP address is a known source of malicious activity, i.e. attacks, malware, botnet activity etc
        public let isKnownAttacker: Bool?
        
        /// is `true` if the IP address is a known source of abuse i.e. spam, harvesters, registration bots and other nuisance bots etc
        public let isKnownAbuser: Bool?
        
        /// is `true` if either one of `isKnownAttacker` or `isKnownAttacker` is true
        public let isThreat: Bool?
        
        /// is `true` if the IP Address is a known Bogon i.e. an unassigned, unaddressable IP address
        public let isBogon: Bool?
        
    }
    
}
