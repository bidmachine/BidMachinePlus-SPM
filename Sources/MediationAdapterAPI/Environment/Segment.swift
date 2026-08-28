//
//  MediationAdapterAPI
//
//  Created by BidMachine Team on 14/06/2023.
//  Copyright © 2023 BidMachine Inc. All rights reserved.
//

import Foundation


@objc(MFGender)
public enum Gender: Int {
    case male
    case female
    case other
}


@objc(MFSegment)
public protocol Segment {
    var uid: String? { get }

    var gender: Gender { get set }

    var age: Int { get set }

    var level: Int { get set }

    var isPaid: Bool { get set }

    var inAppAmount: Price { get set }

    var customAttributes: [String: AnyHashable] { get }

    func setCustomAttribute(_ customAttribute: AnyHashable?, for key: String)
}


