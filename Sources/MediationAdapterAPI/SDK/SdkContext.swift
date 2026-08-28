//
//  MediationAdapterAPI
//
//  Created by BidMachine Team on 14/07/2026.
//  Copyright © 2026 BidMachine Inc. All rights reserved.
//

import Foundation

public protocol SdkContext {
    var isTestMode: Bool { get }
    var extras: [String: AnyHashable] { get }
    var regulations: MediationAdapterAPI.Regulations { get }
    var segment: Segment { get }
}
