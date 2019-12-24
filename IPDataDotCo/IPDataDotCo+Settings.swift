//
// Copyright © HO-SUNE Vincent. All rights reserved.
//

import Foundation

extension IPDataDotCo {
    
    /// Settings for `IPDataDotCo`
    public struct Settings {

        /// the base api endpoint. default:  [https://api.ipdata.co](https://api.ipdata.co)
        public let host: String

        /// your ipdata.co api key
        /// - note: get a free api key at [https://ipdata.co/registration.html](https://ipdata.co/registration.html)
        public let apiKey: String
        
        /// Create `Settings` to use in `IPDataDotCo`
        /// - parameter host: the base api endpoint to use.
        /// - parameter apiKey: the api key to use.
        public init(host: String = "https://api.ipdata.co", apiKey: String) {
            self.host = host
            self.apiKey = apiKey
        }
    }
    
}
