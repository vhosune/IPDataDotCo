//
// Created by Vincent HO-SUNE.
// Copyright © 2019 HO-SUNE Vincent. All rights reserved.
//

import Foundation

extension IPDataDotCo {
    
    public struct Language: Codable {
        
        enum CodingKeys: String, CodingKey {
            case name
            case localName = "native"
        }
        
        /// The name of the language in English
        public let name: String?
        
        /// The Native name of the language.
        public let localName: String?
    }
    
}
