//
//  MediationAdapterAPI
//
//  Created by BidMachine Team on 12/04/2023.
//  Copyright © 2023 BidMachine Inc. All rights reserved.
//

import Foundation


public enum SdkError: Error, CustomStringConvertible {
    case generic(error: Error)
    case message(String)
    case unknown

    case noFill
    case cancelled
    case internalInconsistency
    case invalidPresentationState
    case unableToFindRootViewController

    public var description: String {
        switch self {
        case .noFill:
            return "No fill"
        case .internalInconsistency:
            return "Inconsistent state"
        case .unknown:
            return "Unknown"
        case .cancelled:
            return "Request has been cancelled"
        case .invalidPresentationState:
            return "Invalid presentation state"
        case .unableToFindRootViewController:
            return "Unable to find root view controller"
        case let .generic(error):
            return error.localizedDescription
        case let .message(message):
            return message
        }
    }

    public init(_ message: String) {
        self = .message(message)
    }

    public init(_ error: Error?) {
        if let error = error as? SdkError {
            self = error
        } else if let error = error {
            self = .generic(error: error)
        } else {
            self = .unknown
        }
    }
}


