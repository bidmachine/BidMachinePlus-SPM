//
//  MediationAdapterAPI
//
//  Created by BidMachine Team on 20/08/2026.
//  Copyright © 2026 BidMachine Inc. All rights reserved.
//

import Foundation

public struct AdapterInitializationContext {
    public let sdk: any SdkContext
    public let isLoggingEnabled: Bool

    public init(sdk: any SdkContext, isLoggingEnabled: Bool) {
        self.sdk = sdk
        self.isLoggingEnabled = isLoggingEnabled
    }
}
