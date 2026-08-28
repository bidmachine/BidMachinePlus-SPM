//
//  MediationAdapterAPI
//
//  Created by BidMachine Team on 05/07/2022.
//  Copyright © 2022 BidMachine Inc. All rights reserved.
//

import Foundation
import UIKit


public protocol InterstitialDemandProvider: DemandProvider {
    func show(ad: DemandAdType, from viewController: UIViewController)
}


