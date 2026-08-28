//
//  MediationAdapterAPI
//
//  Created by BidMachine Team on 28/03/2023.
//  Copyright © 2023 BidMachine Inc. All rights reserved.
//

import Foundation

@objc
public protocol DemandAd {
    @objc var id: String { get }

    @objc optional
    var networkName: String { get }

    @objc optional
    var dsp: String { get }

    @objc optional
    var price: Price { get }

    @objc optional
    var currency: Currency { get }
}
