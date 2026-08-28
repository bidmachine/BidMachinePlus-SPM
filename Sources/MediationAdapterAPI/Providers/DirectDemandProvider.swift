//
//  MediationAdapterAPI
//
//  Created by BidMachine Team on 19/04/2023.
//  Copyright © 2023 BidMachine Inc. All rights reserved.
//

import Foundation


public protocol DirectDemandProvider: DemandProvider {
    associatedtype AdUnitExtras: Decodable

    // Engine-facing (associatedtype-erased) entry. Adapters never implement this — the default
    // below decodes the ad-unit extras and forwards to the typed `load` the adapter implements.
    func load(
        pricefloor: Price,
        adUnitExtrasDecoder: Decoder,
        response: @escaping DemandProviderResponse
    )

    func load(
        pricefloor: Price,
        adUnitExtras: AdUnitExtras,
        response: @escaping DemandProviderResponse
    )
}


extension DirectDemandProvider {
    public func load(
        pricefloor: Price,
        adUnitExtrasDecoder: Decoder,
        response: @escaping DemandProviderResponse
    ) {
        do {
            let adUnitExtas = try AdUnitExtras(from: adUnitExtrasDecoder)

            load(
                pricefloor: pricefloor,
                adUnitExtras: adUnitExtas,
                response: response
            )
        } catch {
            response(.failure(.incorrectAdUnitId))
        }
    }
}

