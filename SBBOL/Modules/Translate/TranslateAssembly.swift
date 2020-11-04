//
//  TranslateAssembly.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import UIKit

final class TranslateAssembly {

    // MARK: - Properties

    private var presenter: TranslatePresenter
    private(set) var contentViewController: TranslateViewController
    private var router: TranslateRouter
    private var interactor: TranslateInteractor

    // MARK: - Construction

    init(inputModel: TranslateInputModel, delegate: TranslateDelegate) {
        self.contentViewController = TranslateViewController(nibName: "TranslateViewController", bundle: Bundle(for: type(of: self)))
        self.interactor = TranslateInteractor(model: inputModel)
        self.router = TranslateRouter(contentViewController: self.contentViewController)
        self.presenter = TranslatePresenter(contentViewController: self.contentViewController, router: self.router, interactor: self.interactor, inputModel: inputModel, delegate: delegate)
        self.contentViewController.presenter = self.presenter
    }

    // MARK: - Functions
}

extension TranslateAssembly: TabAssembly {

    var viewController: UIViewController {
        return contentViewController
    }
}
