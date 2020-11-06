//
//  TranslateViewController.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 04.11.2020.
//

import UIKit

final class TranslateViewController: UIViewController {

    // MARK: - Constants

    // MARK: - Properties

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    weak var presenter: TranslateViewToPresenter?

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        localize()
        inputTextField.delegate = self
    }

    // MARK: - IBActions

    // MARK: - Functions

    // MARK: - Private functions

    private func localize() {
    }
}

extension TranslateViewController: TranslatePresenterToView {

    func showTranslation(text: String) {
        outputLabel.text = text
    }

    func update(isLoading: Bool) {
        loadingView.isHidden = !isLoading
        isLoading ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
    }
}

extension TranslateViewController: TranslateControllerToRouter {
}

extension TranslateViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        presenter?.didEnter(text: textField.text)
        return true
    }
}
