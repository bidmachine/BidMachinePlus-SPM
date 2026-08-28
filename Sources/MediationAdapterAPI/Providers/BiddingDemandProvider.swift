//
//  MediationAdapterAPI
//
//  Created by BidMachine Team on 31/05/2023.
//  Copyright © 2023 BidMachine Inc. All rights reserved.
//

import Foundation

public protocol BiddingDemandProvider: DemandProvider {
    associatedtype BiddingPayload: Decodable
    associatedtype BiddingTokenExtras: Decodable
    associatedtype AdUnitExtras: Decodable

    // Engine-facing (associatedtype-erased) entries. Adapters never implement these — the defaults
    // below decode and forward to the typed `collectBiddingToken` / `load` the adapter implements.
    func collectBiddingTokenEncoder(
        adUnitExtrasDecoder: Decoder,
        response: @escaping (Result<String, MediationError>) -> ()
    )

    func collectBiddingTokenEncoder(
        auctionKey: String?,
        adUnitExtrasDecoder: Decoder,
        response: @escaping (Result<String, MediationError>) -> ()
    )

    func load(
        payloadDecoder: Decoder,
        adUnitExtrasDecoder: Decoder,
        response: @escaping DemandProviderResponse
    )

    func collectBiddingToken(
        biddingTokenExtras: BiddingTokenExtras,
        response: @escaping (Result<String, MediationError>) -> ()
    )

    func collectBiddingToken(
        auctionKey: String?,
        biddingTokenExtras: BiddingTokenExtras,
        response: @escaping (Result<String, MediationError>) -> ()
    )

    func load(
        payload: BiddingPayload,
        adUnitExtras: AdUnitExtras,
        response: @escaping DemandProviderResponse
    )
}

extension BiddingDemandProvider {
    public func collectBiddingToken(
        auctionKey: String?,
        biddingTokenExtras: BiddingTokenExtras,
        response: @escaping (Result<String, MediationError>) -> ()
    ) {
        collectBiddingToken(
            biddingTokenExtras: biddingTokenExtras,
            response: response
        )
    }

    public func collectBiddingTokenEncoder(
        auctionKey: String?,
        adUnitExtrasDecoder: Decoder,
        response: @escaping (Result<String, MediationError>) -> ()
    ) {
        do {
            let biddingTokenExtras = try BiddingTokenExtras(from: adUnitExtrasDecoder)
            collectBiddingToken(
                auctionKey: auctionKey,
                biddingTokenExtras: biddingTokenExtras,
                response: response
            )
        } catch {
            response(.failure(.incorrectAdUnitId))
        }
    }

    public func collectBiddingTokenEncoder(
        adUnitExtrasDecoder: Decoder,
        response: @escaping (Result<String, MediationError>) -> ()
    ) {
        collectBiddingTokenEncoder(
            auctionKey: nil,
            adUnitExtrasDecoder: adUnitExtrasDecoder,
            response: response
        )
    }

    public func load(
        payloadDecoder: Decoder,
        adUnitExtrasDecoder: Decoder,
        response: @escaping DemandProviderResponse
    ) {
        do {
            let payload = try BiddingPayload(from: payloadDecoder)
            let adUnitExtras = try AdUnitExtras(from: adUnitExtrasDecoder)

            load(
                payload: payload,
                adUnitExtras: adUnitExtras,
                response: response
            )
        } catch {
            response(.failure(.incorrectAdUnitId))
        }
    }
}

