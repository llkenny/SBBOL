//
//  LanguageSelectorRouter.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 06.11.2020.
//

import Foundation

enum LanguageSelectorNavigation {
    case
    none
}

typealias LanguageSelectorRouterClosure = (() -> Void)

final class LanguageSelectorRouter {

    // MARK: - Properties

    private weak var contentViewController: LanguageSelectorControllerToRouter?

    // MARK: - Construction

    init(contentViewController: LanguageSelectorControllerToRouter) {
        self.contentViewController = contentViewController
    }

    // MARK: - Functions
}

extension LanguageSelectorRouter: LanguageSelectorPresenterToRouter {

    func navigate(to destination: LanguageSelectorNavigation, completion: LanguageSelectorRouterClosure? = nil) {
        switch destination {
        case .none:
            break
        }
    }
}
