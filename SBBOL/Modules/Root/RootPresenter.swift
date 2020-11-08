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

    func viewIsReady() {
        contentViewController?.update(isLoading: true)
        interactor?.fetchLanguages { [weak self] result in
            guard let self = self else { return }
            self.contentViewController?.update(isLoading: false)
            switch result {
            case .success:
                self.showMainTabBar()
            case .failure(let error):
                self.contentViewController?.showError(error: error)
                // TODO: Retry button or something else
            }
        }
    }

    func configTabAssemblies() -> [TabAssembly] {
        let translate = TranslateAssembly(inputModel: TranslateInputModel(), delegate: self)
        let history = HistoryAssembly(inputModel: HistoryInputModel(), delegate: self)
        let settings = SettingsAssembly(inputModel: SettingsInputModel(), delegate: self)
        return [translate, history, settings]
    }

    // MARK: - Private functions

    private func showMainTabBar() {
        let assemblies = configTabAssemblies()
        router?.navigate(to: .mainTabBar(assemblies: assemblies), completion: nil)
    }
}

extension RootPresenter: RootModule {
}

extension RootPresenter: RootViewToPresenter {
}

extension RootPresenter: TranslateDelegate {}
extension RootPresenter: HistoryDelegate {}
extension RootPresenter: SettingsDelegate {}
