//
//  MediationAdapterAPI
//
//  Created by BidMachine Team on 07/07/2022.
//  Copyright © 2022 BidMachine Inc. All rights reserved.
//

import Foundation


@objc(MFReward)
public protocol Reward {
    var label: String { get }
    var amount: Int { get }
}


final public class RewardWrapper<Wrapped>: Reward {
    public let label: String
    public let amount: Int
    public let wrapped: Wrapped

    public init(
        label: String,
        amount: Int,
        wrapped: Wrapped
    ) {
        self.label = label
        self.amount = amount
        self.wrapped = wrapped
    }
}


