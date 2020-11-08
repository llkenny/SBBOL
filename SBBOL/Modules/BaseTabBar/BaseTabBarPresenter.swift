//
//  BaseTabBarPresenter.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import Foundation

final class BaseTabBarPresenter {

    // MARK: - Properties

    private weak var contentViewController: BaseTabBarPresenterToView?
    private weak var router: BaseTabBarPresenterToRouter?
    private weak var interactor: BaseTabBarPresenterToInteractor?
    private weak var delegate: BaseTabBarDelegate?
    private var inputModel: BaseTabBarInputModel

    // MARK: - Construction

    init(contentViewController: BaseTabBarPresenterToView, router: BaseTabBarPresenterToRouter, interactor: BaseTabBarPresenterToInteractor, inputModel: BaseTabBarInputModel, delegate: BaseTabBarDelegate) {
        self.contentViewController = contentViewController
        self.router = router
        self.interactor = interactor
        self.inputModel = inputModel
        self.delegate = delegate
    }

    // MARK: - Functions

    func viewIsReady() {
        let viewControllers = inputModel.assemblies.map { $0.viewController }
        contentViewController?.update(viewControllers: viewControllers)
    }
}

extension BaseTabBarPresenter: BaseTabBarModule {

    func showTranslationTab(historyItem: History) {
        guard let contentViewController = contentViewController else { return }
        if let index = contentViewController.viewControllers?.firstIndex (where: { $0 is TranslateViewController }) {
            let assembly = inputModel.assemblies[index] as! TranslateAssembly
            assembly.module.show(historyItem: historyItem)
            contentViewController.selectTab(index: index)
        }
    }
}

extension BaseTabBarPresenter: BaseTabBarViewToPresenter {
}
