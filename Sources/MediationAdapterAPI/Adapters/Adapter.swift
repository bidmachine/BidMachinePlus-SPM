//
//  MediationAdapterAPI
//
//  Created by BidMachine Team on 15/06/2022.
//  Copyright © 2022 BidMachine Inc. All rights reserved.
//

import Foundation


public protocol Adapter {
    var demandId: String { get }
    var name: String { get }
    var adapterVersion: String { get }
    var sdkVersion: String { get }
    var fullAdapterVersion: String { get }

    init()
}

extension Adapter {
    public var fullAdapterVersion: String {
        return sdkVersion + "." + adapterVersion
    }
}
