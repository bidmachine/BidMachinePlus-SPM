//
//  MediationAdapterAPI
//
//  Created by BidMachine Team on 28/03/2023.
//  Copyright © 2023 BidMachine Inc. All rights reserved.
//

import Foundation


// MARK: Ad Revenue wrapper
final public class AdRevenueModel: AdRevenue {
    public let revenue: Price
    public let precision: RevenuePrecision
    public let currency: Currency

    public init(
        revenue: Price,
        precision: RevenuePrecision,
        currency: Currency = .default
    ) {
        self.revenue = revenue
        self.precision = precision
        self.currency = currency
    }

    convenience public init(
        eCPM: Price,
        precision: RevenuePrecision = .estimated
    ) {
        self.init(
            revenue: eCPM / 1000,
            precision: precision
        )
    }
}
