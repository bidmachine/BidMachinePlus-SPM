//
//  MediationAdapterAPI
//
//  Created by BidMachine Team on 13/07/2023.
//  Copyright © 2023 BidMachine Inc. All rights reserved.
//

import Foundation


public protocol InitializableAdapter: Adapter {
    var isInitialized: Bool { get }

    func initialize(
        from decoder: Decoder,
        context: AdapterInitializationContext,
        completion: @escaping (Result<Void, SdkError>) -> Void
    )
}
