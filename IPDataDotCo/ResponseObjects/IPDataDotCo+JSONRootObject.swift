//
// Copyright © HO-SUNE Vincent. All rights reserved.
//

import Foundation

extension IPDataDotCo {

    /// JSON root object
    /// - version: 2019/12
    public struct JSONRootObject: Codable {
        
        enum CodingKeys: String, CodingKey {
            case ipAddress = "ip"
            case isEuropean = "is_eu"
            case city
            case region
            case regionCode = "region_code"
            case countryName = "country_name"
            case countryCode = "country_code"
            case continentName = "continent_name"
            case continentCode = "continent_code"
            case latitude
            case longitude
            case asn
            case organisation
            case postal
            case callingCode = "calling_code"
            case flag
            case emojiFlag = "emoji_flag"
            case emojiUnicode = "emoji_unicode"
            case carrier
            case languages
            case currency
            case timezone = "time_zone"
            case threat
            case count
            case message
        }
        
        /// if there was an error, `message` is set with the error description
        public let message: String?
        
        /// The total number of requests made by your API key in the last 24 hrs.
        /// - note: Updates once a minute.
        public let count: String?

        /// The IP address that was looked up.
        public let ipAddress: String?
        
        /// Returns true or false depending on whether the country is a recognized member of the European Union.
        public let isEuropean: Bool?
                
        /// The name of the city from where the IP Address is located.
        public let city: String?
        
        /// The name of the region where the IP Address is located.
        public let region: String?
        
        /// The 3 letter ISO 3166-2 code for the region.
        public let regionCode: String?
        
        /// The name of the country where the IP Address is located.
        public let countryName: String?
        
        /// The 2 letter ISO 3166-1 alpha-2 code for the country.
        public let countryCode: String?
        
        /// The name of the continent where the IP Address is located.
        /// # values:
        /// - Africa
        /// - Antarctica
        /// - Asia
        /// - Europe
        /// - North America
        /// - Oceania
        /// - Solanguuth America
        public let continentName: String?
        
        /// The 2 letter ISO 3166-1 alpha-2 code for the continent.
        /// # values:
        /// - AF
        /// - AN
        /// - AS
        /// - EU
        /// - NA
        /// - OC
        /// - SA
        public let continentCode: String?
        
        /// An approximate latitudinal location for the IP Address. Often near the center of population.
        public let latitude: Float?
        
        /// An approximate longitudinal location for the IP Address. Often near the center of population
        public let longitude: Float?
        
        /// The Autonomous System Number that references the IP Address's owning organization.
        public let asn: Asn?

        /// The name of the Organisation that owns the IP Address. This will default to the ISP is the name of the organisation is not available.
        public let organisation: String?
        
        /// The Postal code for where the IP Address is located.
        public let postal: String?
        
        /// The International Calling Code for the country where the IP Address is located.
        public let callingCode: String?
        
        /// A link to a PNG file with the flag of the country where the IP Address is located.
        public let flag: String?
        
        /// An emoji version of the flag of the country where the IP Address is located.
        public let emojiFlag: String?
        
        /// The Unicode for the emoji flag.
        public let emojiUnicode: String?
        
        /// the IP Addresses's carrier.
        public let carrier: Carrier?
        
        /// list of individual language objects.
        public let languages: [Language]?
        
        /// the IP Address country's main currency.
        public let currency: Currency?
        
        /// the Timezone the IP Address belongs to.
        public let timezone: TimeZone?
        
        /// the threat intelligence profile of the IP Address.
        public let threat: Threat?
    }
    
}
