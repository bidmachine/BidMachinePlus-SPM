//
//  MediationAdapterAPI
//
//  Created by BidMachine Team on 13/07/2023.
//  Copyright © 2023 BidMachine Inc. All rights reserved.
//

import Foundation


public protocol ParameterizedInitializableAdapter: InitializableAdapter {
    associatedtype Parameters: Decodable

    func initialize(
        parameters: Parameters,
        context: AdapterInitializationContext,
        completion: @escaping (SdkError?) -> Void
    )
}


extension ParameterizedInitializableAdapter {
    public func initialize(
        from decoder: Decoder,
        context: AdapterInitializationContext,
        completion: @escaping (Result<Void, SdkError>) -> Void
    ) {
        var parameters: Parameters?

        do {
            parameters = try Parameters(from: decoder)
        } catch {
            completion(.failure(SdkError(error)))
        }

        guard let parameters = parameters else { return }

        initialize(parameters: parameters, context: context) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
}
