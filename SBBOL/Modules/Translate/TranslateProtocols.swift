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

    func didEnter(text: String?)
}

protocol TranslatePresenterToView: class {  // Presenter calls, View listens. Presenter receives a reference from this protocol to access View. View conforms to the protocol.

    func showTranslation(text: String)
    func update(isLoading: Bool)
}

protocol TranslatePresenterToRouter: class {   // Presenter calls, Router listens.

    func navigate(to destination: TranslateNavigation, completion: TranslateRouterClosure?)
}

protocol TranslateControllerToRouter: class {
}

protocol TranslatePresenterToInteractor: class {   // Presenter calls, Interactor listens.

    func translate(text: String, to: String, completion: @escaping (Result<[AzureTranslateResponse], Error>) -> Void)
    func fetch(completion: @escaping (Result<AzureLanguageResponse, Error>) -> Void)
}
