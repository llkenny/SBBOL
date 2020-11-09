//
//  BaseTabBarProtocols.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import UIKit

protocol BaseTabBarModule: class { // Module protocol.

    func showTranslationTab(historyItem: History)
}

protocol BaseTabBarDelegate: class { // Delegate protocol.
}

protocol BaseTabBarViewToPresenter: class { // View calls, Presenter listens.
}

protocol BaseTabBarPresenterToView: class {  // Presenter calls, View listens. Presenter receives a reference from this protocol to access View. View conforms to the protocol.

    var viewControllers: [UIViewController]? { get }

    func update(viewControllers: [UIViewController])
    func selectTab(index: Int)
}

protocol BaseTabBarPresenterToRouter: class {   // Presenter calls, Router listens.

    func navigate(to destination: BaseTabBarNavigation, completion: BaseTabBarRouterClosure?)
}

protocol BaseTabBarControllerToRouter: class {
}

protocol BaseTabBarPresenterToInteractor: class {   // Presenter calls, Interactor listens.
}
