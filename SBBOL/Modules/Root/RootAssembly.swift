//
//  RootAssembly.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import UIKit

final class RootAssembly {

    // MARK: - Properties

    private var presenter: RootPresenter
    private(set) var contentViewController: RootViewController
    private var router: RootRouter
    private var interactor: RootInteractor

    // MARK: - Construction

    init(inputModel: RootInputModel, delegate: RootDelegate) {
        self.contentViewController = RootViewController(nibName: "RootViewController", bundle: Bundle(for: type(of: self)))
        self.interactor = RootInteractor(model: inputModel)
        self.router = RootRouter(contentViewController: self.contentViewController)
        self.presenter = RootPresenter(contentViewController: self.contentViewController, router: self.router, interactor: self.interactor, inputModel: inputModel, delegate: delegate)
        self.contentViewController.presenter = self.presenter
        router.module = presenter
    }

    // MARK: - Functions
}
