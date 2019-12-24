//
// Copyright © HO-SUNE Vincent. All rights reserved.
//

import Foundation

extension IPDataDotCo {
    
    /// Available ressources to query
    public enum QueryFields: String {
        
        /// The IP address that was looked up.
        case ipAddress = "ip"
        
        /// Whether the country is a recognized member of the European Union.
        case isEuropean = "is_eu"
        
        /// The name of the city from where the IP Address is located.
        case city
        
        /// The name of the region where the IP Address is located.
        case region
        
        /// The 3 letter ISO 3166-2 code for the region.
        case regionCode = "region_code"
        
        /// The name of the country where the IP Address is located.
        case countryName = "country_name"
        
        /// The 2 letter ISO 3166-1 alpha-2 code for the country.
        case countryCode = "country_code"
        
        /// The name of the continent where the IP Address is located.
        case continentName = "continent_name"
        
        /// The 2 letter ISO 3166-1 alpha-2 code for the continent.
        case continentCode = "continent_code"
        
        /// An approximate latitudinal location for the IP Address.
        case latitude
        
        /// An approximate longitudinal location for the IP Address.
        case longitude
        
        /// The Autonomous System Number that references the IP Address's owning organization.
        case asn
        
        /// The name of the Organisation that owns the IP Address.
        case organisation
        
        /// The Postal code for where the IP Address is located.
        case postal
        
        /// The International Calling Code for the country where the IP Address is located.
        case callingCode = "calling_code"
        
        /// A link to a PNG file with the flag of the country where the IP Address is located.
        case flag
        
        /// An emoji version of the flag of the country where the IP Address is located.
        case emojiFlag = "emoji_flag"
        
        /// The Unicode for the emoji flag.
        case emojiUnicode = "emoji_unicode"
        
        /// A JSON object with details of the IP Addresses's carrier.
        case carrier
        
        /// A JSON list of individual language objects.
        case languages
        
        /// A JSON object with details of the IP Address country's main currency.
        case currency
        
        /// A JSON object with details of the Timezone the IP Address belongs to.
        case timezone = "time_zone"
        
        /// A JSON object representing the threat intelligence profile of the IP Address.
        case threat

        /// The total number of requests made by your API key in the last 24 hrs.
        case count
    }
    
}
