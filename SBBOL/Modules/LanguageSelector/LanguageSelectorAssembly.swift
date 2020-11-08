//
//  LanguageSelectorAssembly.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 06.11.2020.
//

import UIKit

final class LanguageSelectorAssembly {

    // MARK: - Properties

    private var presenter: LanguageSelectorPresenter
    private(set) var contentViewController: LanguageSelectorViewController
    private var router: LanguageSelectorRouter
    private var interactor: LanguageSelectorInteractor

    // MARK: - Construction

    init(inputModel: LanguageSelectorInputModel, delegate: LanguageSelectorDelegate) {
        self.contentViewController = LanguageSelectorViewController(nibName: "LanguageSelectorViewController", bundle: Bundle(for: type(of: self)))
        self.interactor = LanguageSelectorInteractor(model: inputModel)
        self.router = LanguageSelectorRouter(contentViewController: self.contentViewController)
        self.presenter = LanguageSelectorPresenter(contentViewController: self.contentViewController, router: self.router, interactor: self.interactor, inputModel: inputModel, delegate: delegate)
        self.contentViewController.presenter = self.presenter

        contentViewController.loadViewIfNeeded()
        presenter.viewIsReady()
    }

    // MARK: - Functions
}
