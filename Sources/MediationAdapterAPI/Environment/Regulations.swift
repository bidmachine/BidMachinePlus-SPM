//
//  MediationAdapterAPI
//
//  Created by BidMachine Team on 30/05/2023.
//  Copyright © 2023 BidMachine Inc. All rights reserved.
//

import Foundation


@objc(MFCOPPAAppliesStatus)
public enum COPPAAppliesStatus: Int {
    case unknown = -1
    case no = 0
    case yes = 1
}


@objc(MFGDPRAppliesStatus)
public enum GDPRAppliesStatus: Int {
    case unknown = -1
    case doesNotApply = 0
    case applies = 1
}

@objc(MFRegulations)
public protocol Regulations {

    // GDPR
    // https://github.com/InteractiveAdvertisingBureau/GDPR-Transparency-and-Consent-Framework/blob/master/TCFv2/IAB%20Tech%20Lab%20-%20CMP%20API%20v2.md#what-does-the-gdprapplies-value-mean
    var gdpr: GDPRAppliesStatus { get set }
    var gdprConsentString: String? { get set }
    var gdprApplies: Bool { get }
    var hasGdprConsent: Bool { get }



    // CCPA and US Privacy String
    // https://github.com/InteractiveAdvertisingBureau/USPrivacy/blob/master/CCPA/US%20Privacy%20String.md
    var usPrivacyString: String? { get set }
    var ccpaApplies: Bool { get }
    var hasCcpaConsent: Bool { get }


    // COPPA
    var coppa: COPPAAppliesStatus { get set }
    var coppaApplies: Bool { get }

}


