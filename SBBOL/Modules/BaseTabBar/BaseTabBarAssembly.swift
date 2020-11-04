//
//  BaseTabBarAssembly.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import UIKit

final class BaseTabBarAssembly {

    // MARK: - Properties

    private var presenter: BaseTabBarPresenter
    private(set) var contentViewController: BaseTabBarViewController
    private var router: BaseTabBarRouter
    private var interactor: BaseTabBarInteractor

    // MARK: - Construction

    init(inputModel: BaseTabBarInputModel, delegate: BaseTabBarDelegate) {
        self.contentViewController = BaseTabBarViewController(nibName: "BaseTabBarViewController", bundle: Bundle(for: type(of: self)))
        self.interactor = BaseTabBarInteractor(model: inputModel)
        self.router = BaseTabBarRouter(contentViewController: self.contentViewController)
        self.presenter = BaseTabBarPresenter(contentViewController: self.contentViewController, router: self.router, interactor: self.interactor, inputModel: inputModel, delegate: delegate)
        self.contentViewController.presenter = self.presenter
    }

    // MARK: - Functions
}
