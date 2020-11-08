//
//  HistoryAssembly.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import UIKit

final class HistoryAssembly {

    // MARK: - Properties

    private var presenter: HistoryPresenter
    private(set) var contentViewController: HistoryViewController
    private var router: HistoryRouter
    private var interactor: HistoryInteractor

    // MARK: - Construction

    init(inputModel: HistoryInputModel, delegate: HistoryDelegate) {
        self.contentViewController = HistoryViewController(nibName: "HistoryViewController", bundle: Bundle(for: type(of: self)))
        self.interactor = HistoryInteractor(model: inputModel)
        self.router = HistoryRouter(contentViewController: self.contentViewController)
        self.presenter = HistoryPresenter(contentViewController: self.contentViewController, router: self.router, interactor: self.interactor, inputModel: inputModel, delegate: delegate)
        self.contentViewController.presenter = self.presenter

        contentViewController.loadViewIfNeeded()
        presenter.viewIsReady()
    }

    // MARK: - Functions
}

extension HistoryAssembly: TabAssembly {

    var viewController: UIViewController {
        return contentViewController
    }
}
