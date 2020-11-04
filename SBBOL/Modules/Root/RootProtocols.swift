//
//  RootProtocols.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import UIKit

protocol RootModule: BaseTabBarDelegate { // Module protocol.
}

protocol RootDelegate: class { // Delegate protocol.
}

protocol RootViewToPresenter: class { // View calls, Presenter listens.
}

protocol RootPresenterToView: class {  // Presenter calls, View listens. Presenter receives a reference from this protocol to access View. View conforms to the protocol.
}

protocol RootPresenterToRouter: class {   // Presenter calls, Router listens.

    func navigate(to destination: RootNavigation, completion: RootRouterClosure?)
}

protocol RootControllerToRouter: class {

    func present(viewController: UIViewController)
}

protocol RootPresenterToInteractor: class {   // Presenter calls, Interactor listens.
}
