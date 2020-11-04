//
//  RootPresenter.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import Foundation

final class RootPresenter {

    // MARK: - Properties

    private weak var contentViewController: RootPresenterToView?
    private weak var router: RootPresenterToRouter?
    private weak var interactor: RootPresenterToInteractor?
    private weak var delegate: RootDelegate?
    private var inputModel: RootInputModel

    // MARK: - Construction

    init(contentViewController: RootPresenterToView, router: RootPresenterToRouter, interactor: RootPresenterToInteractor, inputModel: RootInputModel, delegate: RootDelegate) {
        self.contentViewController = contentViewController
        self.router = router
        self.interactor = interactor
        self.inputModel = inputModel
        self.delegate = delegate
    }

    // MARK: - Functions
}

extension RootPresenter: RootModule {
}

extension RootPresenter: RootViewToPresenter {

    func viewDidLoad() {
        router?.navigate(to: .mainTabBar, completion: nil)
    }
}
