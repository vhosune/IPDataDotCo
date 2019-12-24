//
// Copyright © HO-SUNE Vincent. All rights reserved.
//

import Foundation

extension IPDataDotCo {
    
    public struct Asn: Codable {
        
        public enum UsageType: String, Codable {
            /// Belonging to a datacenter (we have mapped 200M+ hosting IP addresses)
            case hosting
            
            /// Belonging to ISP IP space (we have mapped 1B+ isp IPs)
            case isp
            
            /// Educational institutions
            case education = "edu"
            
            /// One of ~25,000 government agencies worldwide
            case government = "gov"
            
            /// Military organizations
            case military = "mil"
            
            /// End-user organizations
            case business
        }
        
        /// The Autonomous System Number
        public let asn: String?
        
        /// The name of the organization that owns the ASN
        public let name: String?
        
        /// The website of the organization
        public let domain: String?
        
        /// The network prefix the IP Address belongs to
        public let route: String?
        
        /// The usage type associated with the IP Address and ASN
        /// # values:
        /// - hosting
        /// - isp
        /// - edu
        /// - gov
        /// - mil
        /// - business
        public let type: String?
        
    }
    
}
