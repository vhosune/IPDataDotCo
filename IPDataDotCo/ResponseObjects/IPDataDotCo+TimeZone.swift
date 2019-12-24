//
// Copyright © HO-SUNE Vincent. All rights reserved.
//

import Foundation

extension IPDataDotCo {
    
    public struct TimeZone: Codable {
        
        enum CodingKeys: String, CodingKey {
            case name
            case abbreviation = "abbr"
            case utcOffset = "offset"
            case isDaylightSavings = "is_dst"
            case localTime = "current_time"
        }

        /// The name of the Timezone Eg. "America/Los_Angeles"
        public let name: String?
        
        /// The Abbreviation of the Timezone Eg. "PDT"
        public let abbreviation: String?
        
        /// The UTC offset of the Timezone Eg. "-0700"
        public let utcOffset: String?
        
        /// true or false depending on whether or not Daylight Savings have been accounted for.
        public let isDaylightSavings: Bool?
        
        /// The exact current time in the Timezone the IP Address belongs to accounting for Daylight Savings.
        /// as ISO 8601 with fractional seconds
        /// Eg. "2019-12-24T03:10:16.467761+01:00"
        public let localTime: String?
                
    }
    
}
