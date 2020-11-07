//
//  RootViewController.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import UIKit

final class RootViewController: UIViewController {

    // MARK: - Constants

    // MARK: - Properties
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loadingLabel: UILabel!

    weak var presenter: RootViewToPresenter?
    private weak var current: UIViewController?

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        localize()
    }

    // MARK: - IBActions

    // MARK: - Functions

    // MARK: - Private functions

    private func localize() {
        loadingLabel.text = "Loading resources...\nPlease wait"
    }

    private func dismissCurrent() {
        guard let current = current else { return }
        current.willMove(toParent: nil)
        current.view.removeFromSuperview()
        current.removeFromParent()
        current.didMove(toParent: nil)
    }
}

extension RootViewController: RootPresenterToView {
}

extension RootViewController: RootControllerToRouter {

    func present(viewController: UIViewController) {
        viewController.willMove(toParent: self)
        addChild(viewController)
        viewController.view.frame = view.bounds
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
        dismissCurrent()
        current = viewController
    }
}

extension RootViewController: AbleToShowError {}
extension RootViewController: AbleToShowActivityIndicator {}
