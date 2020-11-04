//
//  RootRouter.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import Foundation

enum RootNavigation {
    case
    mainTabBar
}

typealias RootRouterClosure = (() -> Void)

final class RootRouter {

    // MARK: - Properties

    private weak var contentViewController: RootControllerToRouter?
    private(set) var baseTabBarAssembly: BaseTabBarAssembly?
    unowned var module: RootModule!

    // MARK: - Construction

    init(contentViewController: RootControllerToRouter) {
        self.contentViewController = contentViewController
    }

    // MARK: - Functions

    private func presentMainTabBar() {
        let baseTabBarAssembly = BaseTabBarAssembly(inputModel: BaseTabBarInputModel(), delegate: module)
        contentViewController?.present(viewController: baseTabBarAssembly.contentViewController)
        self.baseTabBarAssembly = baseTabBarAssembly
    }
}

extension RootRouter: RootPresenterToRouter {

    func navigate(to destination: RootNavigation, completion: RootRouterClosure? = nil) {
        switch destination {
        case .mainTabBar:
            presentMainTabBar()
        }
    }
}
