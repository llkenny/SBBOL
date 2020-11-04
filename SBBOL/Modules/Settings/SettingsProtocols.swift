//
//  SettingsProtocols.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import Foundation

protocol SettingsModule: class { // Module protocol.
}

protocol SettingsDelegate: class { // Delegate protocol.
}

protocol SettingsViewToPresenter: class { // View calls, Presenter listens.
}

protocol SettingsPresenterToView: class {  // Presenter calls, View listens. Presenter receives a reference from this protocol to access View. View conforms to the protocol.
}

protocol SettingsPresenterToRouter: class {   // Presenter calls, Router listens.

    func navigate(to destination: SettingsNavigation, completion: SettingsRouterClosure?)
}

protocol SettingsControllerToRouter: class {
}

protocol SettingsPresenterToInteractor: class {   // Presenter calls, Interactor listens.
}
