//
//  SettingsRouter.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import Foundation

enum SettingsNavigation {
    case
    none
}

typealias SettingsRouterClosure = (() -> Void)

final class SettingsRouter {

    // MARK: - Properties

    private weak var contentViewController: SettingsControllerToRouter?

    // MARK: - Construction

    init(contentViewController: SettingsControllerToRouter) {
        self.contentViewController = contentViewController
    }

    // MARK: - Functions
}

extension SettingsRouter: SettingsPresenterToRouter {

    func navigate(to destination: SettingsNavigation, completion: SettingsRouterClosure? = nil) {
        switch destination {
        case .none:
            break
        }
    }
}
