//
//  HistoryProtocols.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import Foundation

protocol HistoryModule: class { // Module protocol.
}

protocol HistoryDelegate: class { // Delegate protocol.
}

protocol HistoryViewToPresenter: class { // View calls, Presenter listens.
}

protocol HistoryPresenterToView: class {  // Presenter calls, View listens. Presenter receives a reference from this protocol to access View. View conforms to the protocol.
}

protocol HistoryPresenterToRouter: class {   // Presenter calls, Router listens.

    func navigate(to destination: HistoryNavigation, completion: HistoryRouterClosure?)
}

protocol HistoryControllerToRouter: class {
}

protocol HistoryPresenterToInteractor: class {   // Presenter calls, Interactor listens.
}
