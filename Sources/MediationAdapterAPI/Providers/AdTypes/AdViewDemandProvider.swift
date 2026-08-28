//
//  MediationAdapterAPI
//
//  Created by BidMachine Team on 07/07/2022.
//  Copyright © 2022 BidMachine Inc. All rights reserved.
//

import Foundation
import UIKit

public struct AdViewContext {
    public var format: BannerFormat
    public var size: CGSize
    public var rootViewController: UIViewController?

    public init(
        format: BannerFormat,
        size: CGSize,
        rootViewController: UIViewController?
    ) {
        self.format = format
        self.size = size
        self.rootViewController = rootViewController ?? KeyWindowResolver.topViewController
    }

    public init(
        _ format: BannerFormat,
        rootViewController: UIViewController? = nil
    ) {
        self = .init(
            format: format,
            size: format.preferredSize,
            rootViewController: rootViewController ?? KeyWindowResolver.topViewController
        )
    }
}

public protocol AdViewContainer: UIView {
    var isAdaptive: Bool { get }
}

public protocol DemandProviderAdViewDelegate: AnyObject {
    func providerWillPresentModalView(_ provider: any AdViewDemandProvider, adView: AdViewContainer)
    func providerDidDismissModalView(_ provider: any AdViewDemandProvider, adView: AdViewContainer)
    func providerWillLeaveApplication(_ provider: any AdViewDemandProvider, adView: AdViewContainer)
}

public protocol AdViewDemandProvider: DemandProvider {
    var adViewDelegate: DemandProviderAdViewDelegate? { get set }

    func container(for ad: DemandAdType) -> AdViewContainer?

    func didTrackImpression(for ad: DemandAdType)
}
