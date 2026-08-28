//
//  MediationAdapterAPI
//
//  Created by BidMachine Team on 29/06/2022.
//  Copyright © 2022 BidMachine Inc. All rights reserved.
//

import Foundation


public enum DemandProviderEvent {
    case win
    case lose(String, DemandAd, Price)
}


public typealias DemandProviderResponse = (Result<DemandAd, MediationError>) -> ()


public protocol DemandProviderDelegate: AnyObject {
    func providerWillPresent(_ provider: any DemandProvider)
    func providerDidHide(_ provider: any DemandProvider)
    func providerDidClick(_ provider: any DemandProvider)
    func provider(_ provider: any DemandProvider, didExpireAd ad: DemandAd)
    func provider(_ provider: any DemandProvider, didFailToDisplayAd ad: DemandAd, error: SdkError)
}


public protocol DemandProviderRevenueDelegate: AnyObject {
    func provider(
        _ provider: any DemandProvider,
        didPayRevenue revenue: AdRevenue,
        ad: DemandAd
    )

    func provider(
        _ provider: any DemandProvider,
        didLogImpression ad: DemandAd
    )
}


public protocol DemandProvider: AnyObject {
    associatedtype DemandAdType: DemandAd

    var delegate: DemandProviderDelegate? { get set }

    var revenueDelegate: DemandProviderRevenueDelegate? { get set }

    func notify(ad: DemandAdType, event: DemandProviderEvent)
}


