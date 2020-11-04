//
//  BaseTabBarRouter.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import Foundation

enum BaseTabBarNavigation {
    case
    none
}

typealias BaseTabBarRouterClosure = (() -> Void)

final class BaseTabBarRouter {

    // MARK: - Properties

    private weak var contentViewController: BaseTabBarControllerToRouter?

    // MARK: - Construction

    init(contentViewController: BaseTabBarControllerToRouter) {
        self.contentViewController = contentViewController
    }

    // MARK: - Functions
}

extension BaseTabBarRouter: BaseTabBarPresenterToRouter {

    func navigate(to destination: BaseTabBarNavigation, completion: BaseTabBarRouterClosure? = nil) {
        switch destination {
        case .none:
            break
        }
    }
}
