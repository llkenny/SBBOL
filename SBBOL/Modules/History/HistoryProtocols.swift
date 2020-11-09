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

    func didSelect(historyItem: History)
}

protocol HistoryViewToPresenter: class { // View calls, Presenter listens.

    var itemsCount: Int { get }

    func item(at indexPath: IndexPath) -> History
    func didSelectItem(at indexPath: IndexPath)
    func didSearch()
    func deleteAllButtonTap()
}

protocol HistoryPresenterToView: class {  // Presenter calls, View listens. Presenter receives a reference from this protocol to access View. View conforms to the protocol.

    var searchText: String? { get }
    
    func reload()
}

protocol HistoryPresenterToRouter: class {   // Presenter calls, Router listens.

    func navigate(to destination: HistoryNavigation, completion: HistoryRouterClosure?)
}

protocol HistoryControllerToRouter: class {
}

protocol HistoryPresenterToInteractor: class {   // Presenter calls, Interactor listens.

    func loadHistory() throws -> [History]
    func deleteAll() throws
}
