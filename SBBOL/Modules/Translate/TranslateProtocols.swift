//
//  TranslateProtocols.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import Foundation

protocol TranslateModule: class { // Module protocol.
}

protocol TranslateDelegate: class { // Delegate protocol.
}

protocol TranslateViewToPresenter: class { // View calls, Presenter listens.
}

protocol TranslatePresenterToView: class {  // Presenter calls, View listens. Presenter receives a reference from this protocol to access View. View conforms to the protocol.
}

protocol TranslatePresenterToRouter: class {   // Presenter calls, Router listens.

    func navigate(to destination: TranslateNavigation, completion: TranslateRouterClosure?)
}

protocol TranslateControllerToRouter: class {
}

protocol TranslatePresenterToInteractor: class {   // Presenter calls, Interactor listens.
}
