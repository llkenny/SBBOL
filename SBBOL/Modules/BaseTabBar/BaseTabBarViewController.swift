//
//  BaseTabBarViewController.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import UIKit

final class BaseTabBarViewController: UITabBarController {

    // MARK: - Constants

    // MARK: - Properties

    weak var presenter: BaseTabBarViewToPresenter?

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

extension BaseTabBarViewController: BaseTabBarPresenterToView {

    func update(viewControllers: [UIViewController]) {
        self.viewControllers = viewControllers
    }
}

extension BaseTabBarViewController: BaseTabBarControllerToRouter {
}
