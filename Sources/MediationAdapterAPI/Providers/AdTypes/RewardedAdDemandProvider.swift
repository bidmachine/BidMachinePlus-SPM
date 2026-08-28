//
//  MediationAdapterAPI
//
//  Created by BidMachine Team on 07/07/2022.
//  Copyright © 2022 BidMachine Inc. All rights reserved.
//

import Foundation


public protocol DemandProviderRewardDelegate: AnyObject {
    func provider(
        _ provider: any DemandProvider,
        didReceiveReward reward: Reward
    )
}


public protocol RewardedAdDemandProvider: InterstitialDemandProvider {
    var rewardDelegate: DemandProviderRewardDelegate? { get set }
}


