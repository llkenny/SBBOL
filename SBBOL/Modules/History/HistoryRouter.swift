//
//  HistoryRouter.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import Foundation

enum HistoryNavigation {
    case
    none
}

typealias HistoryRouterClosure = (() -> Void)

final class HistoryRouter {

    // MARK: - Properties

    private weak var contentViewController: HistoryControllerToRouter?

    // MARK: - Construction

    init(contentViewController: HistoryControllerToRouter) {
        self.contentViewController = contentViewController
    }

    // MARK: - Functions
}

extension HistoryRouter: HistoryPresenterToRouter {

    func navigate(to destination: HistoryNavigation, completion: HistoryRouterClosure? = nil) {
        switch destination {
        case .none:
            break
        }
    }
}
