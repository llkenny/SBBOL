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
    @IBOutlet weak var sourceButton: UIButton!
    @IBOutlet weak var destinationButton: UIButton!

    weak var presenter: TranslateViewToPresenter?

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        localize()
        inputTextField.delegate = self
    }

    // MARK: - IBActions

    @IBAction func sourceButtonTap(_ sender: Any) {
        presenter?.sourceButtonTap()
    }

    @IBAction func swapButtonTap(_ sender: Any) {
        presenter?.swapButtonTap()
    }

    @IBAction func destinationButtonTap(_ sender: Any) {
        presenter?.destinationButtonTap()
    }

    // MARK: - Functions

    // MARK: - Private functions

    private func localize() {
    }
}

extension TranslateViewController: TranslatePresenterToView {

    func showTranslation(text: String) {
        outputLabel.text = text
    }
}

extension TranslateViewController: TranslateControllerToRouter {

    func present(controller: LanguageSelectorViewController) {
        present(controller, animated: true)
    }
}

extension TranslateViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        presenter?.didEnter(text: textField.text)
        return true
    }
}

extension TranslateViewController: AbleToShowActivityIndicator {}
