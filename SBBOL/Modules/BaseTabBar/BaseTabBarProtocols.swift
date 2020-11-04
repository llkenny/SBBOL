//
//  BaseTabBarProtocols.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import Foundation

protocol BaseTabBarModule: class { // Module protocol.
}

protocol BaseTabBarDelegate: class { // Delegate protocol.
}

protocol BaseTabBarViewToPresenter: class { // View calls, Presenter listens.
}

protocol BaseTabBarPresenterToView: class {  // Presenter calls, View listens. Presenter receives a reference from this protocol to access View. View conforms to the protocol.
}

protocol BaseTabBarPresenterToRouter: class {   // Presenter calls, Router listens.

    func navigate(to destination: BaseTabBarNavigation, completion: BaseTabBarRouterClosure?)
}

protocol BaseTabBarControllerToRouter: class {
}

protocol BaseTabBarPresenterToInteractor: class {   // Presenter calls, Interactor listens.
}
