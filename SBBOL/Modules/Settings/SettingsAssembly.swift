//
//  SettingsAssembly.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import UIKit

final class SettingsAssembly {

    // MARK: - Properties

    private var presenter: SettingsPresenter
    private(set) var contentViewController: SettingsViewController
    private var router: SettingsRouter
    private var interactor: SettingsInteractor

    // MARK: - Construction

    init(inputModel: SettingsInputModel, delegate: SettingsDelegate) {
        self.contentViewController = SettingsViewController(nibName: "SettingsViewController", bundle: Bundle(for: type(of: self)))
        self.interactor = SettingsInteractor(model: inputModel)
        self.router = SettingsRouter(contentViewController: self.contentViewController)
        self.presenter = SettingsPresenter(contentViewController: self.contentViewController, router: self.router, interactor: self.interactor, inputModel: inputModel, delegate: delegate)
        self.contentViewController.presenter = self.presenter

        contentViewController.loadViewIfNeeded()
    }

    // MARK: - Functions
}

extension SettingsAssembly: TabAssembly {

    var viewController: UIViewController {
        return contentViewController
    }
}
