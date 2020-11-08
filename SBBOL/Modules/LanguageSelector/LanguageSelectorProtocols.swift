//
//  LanguageSelectorProtocols.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 06.11.2020.
//

import Foundation

protocol LanguageSelectorModule: class { // Module protocol.
}

protocol LanguageSelectorDelegate: class { // Delegate protocol.

    func didSelect(language: AzureLanguageResponse.Language)
    func close(controller: LanguageSelectorViewController)
}

protocol LanguageSelectorViewToPresenter: class { // View calls, Presenter listens.

    var itemsCount: Int { get }

    func item(at indexPath: IndexPath) -> String
    func didSelectItem(at indexPath: IndexPath)
    func closeButtonTap(sender: LanguageSelectorViewController)
}

protocol LanguageSelectorPresenterToView: class {  // Presenter calls, View listens. Presenter receives a reference from this protocol to access View. View conforms to the protocol.

    func reload()
}

protocol LanguageSelectorPresenterToRouter: class {   // Presenter calls, Router listens.

    func navigate(to destination: LanguageSelectorNavigation, completion: LanguageSelectorRouterClosure?)
}

protocol LanguageSelectorControllerToRouter: class {
}

protocol LanguageSelectorPresenterToInteractor: class {   // Presenter calls, Interactor listens.

    func loadLanguages() throws -> [Language]
}
