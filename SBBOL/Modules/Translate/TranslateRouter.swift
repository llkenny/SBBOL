//
//  TranslateRouter.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import Foundation

enum TranslateNavigation {
    case
    none
}

typealias TranslateRouterClosure = (() -> Void)

final class TranslateRouter {

    // MARK: - Properties

    private weak var contentViewController: TranslateControllerToRouter?

    // MARK: - Construction

    init(contentViewController: TranslateControllerToRouter) {
        self.contentViewController = contentViewController
    }

    // MARK: - Functions
}

extension TranslateRouter: TranslatePresenterToRouter {

    func navigate(to destination: TranslateNavigation, completion: TranslateRouterClosure? = nil) {
        switch destination {
        case .none:
            break
        }
    }
}
