//
//  HistoryViewController.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import UIKit

final class HistoryViewController: UIViewController {

    // MARK: - Constants

    // MARK: - Properties

    weak var presenter: HistoryViewToPresenter?

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        localize()
    }

    // MARK: - IBActions

    // MARK: - Functions

    // MARK: - Private functions

    private func localize() {
    }
}

extension HistoryViewController: HistoryPresenterToView {
}

extension HistoryViewController: HistoryControllerToRouter {
}
