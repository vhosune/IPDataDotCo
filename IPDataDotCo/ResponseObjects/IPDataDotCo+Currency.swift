//
// Copyright © HO-SUNE Vincent. All rights reserved.
//

import Foundation

extension IPDataDotCo {
    
    public struct Currency: Codable {
        
        enum CodingKeys: String, CodingKey {
            case name
            case code
            case symbol
            case localSymbol = "native"
            case plural
        }
        
        /// The name of the currency.
        public let name: String?
        
        /// The ISO 4217 currency code.
        public let code: String?
        
        /// The symbol of the currency.
        public let symbol: String?
        
        /// The native symbol of the currency.
        public let localSymbol: String?
        
        /// The plural version of the currency. For example; US dollars, Australian dollars, Euros
        public let plural: String?
    }
    
}
