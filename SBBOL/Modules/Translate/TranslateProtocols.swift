//
//  TranslateProtocols.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import Foundation

protocol TranslateModule: LanguageSelectorDelegate { // Module protocol.
}

protocol TranslateDelegate: class { // Delegate protocol.
}

protocol TranslateViewToPresenter: class { // View calls, Presenter listens.

    func didEnter(text: String?)
    func sourceButtonTap()
    func swapButtonTap()
    func destinationButtonTap()
}

protocol TranslatePresenterToView: class, AbleToShowActivityIndicator {  // Presenter calls, View listens. Presenter receives a reference from this protocol to access View. View conforms to the protocol.

    func showTranslation(text: String)
    func change(language: Language, for type: LanguageSelectorType)
}

protocol TranslatePresenterToRouter: class {   // Presenter calls, Router listens.

    func navigate(to destination: TranslateNavigation, completion: TranslateRouterClosure?)
}

protocol TranslateControllerToRouter: class {

    func present(controller: LanguageSelectorViewController)
}

protocol TranslatePresenterToInteractor: class {   // Presenter calls, Interactor listens.

    func translate(text: String, from: String?, to: String, completion: @escaping (Result<[AzureTranslateResponse], Error>) -> Void)
}
