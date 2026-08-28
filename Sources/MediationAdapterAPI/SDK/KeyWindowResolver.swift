//
//  MediationAdapterAPI
//
//  Created by BidMachine Team on 20/08/2026.
//  Copyright © 2026 BidMachine Inc. All rights reserved.
//

import UIKit

enum KeyWindowResolver {
    static var window: UIWindow? {
        UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .compactMap { $0 as? UIWindowScene }
            .flatMap(\.windows)
            .first { $0.isKeyWindow }
    }

    static var topViewController: UIViewController? {
        var current = window?.rootViewController

        while let viewController = current {
            if let presented = viewController.presentedViewController {
                current = presented
            } else if let navigation = viewController as? UINavigationController {
                current = navigation.visibleViewController
            } else if let tabBar = viewController as? UITabBarController {
                current = tabBar.selectedViewController
            } else {
                return viewController
            }
        }
        return nil
    }
}
