//
// Created by Vincent HO-SUNE.
// Copyright © 2019 HO-SUNE Vincent. All rights reserved.
//

import Foundation

extension IPDataDotCo {
    
    public struct Carrier: Codable {
        
        enum CodingKeys: String, CodingKey {
            case name
            case mobileCountryCode = "mmc"
            case mobileNetworkCode = "mnc"
        }
        
        /// The name of the carrier that owns the IP Address.
        public let name: String?
        
        /// The Mobile Country Code of the carrier.
        public let mobileCountryCode: String?
        
        /// The Mobile Network Code that identifies the carrier
        public let mobileNetworkCode: String?
        
    }
    
}
