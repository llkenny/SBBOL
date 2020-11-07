//
//  AbleToShowError.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 07.11.2020.
//
import UIKit

protocol AbleToShowError {

    func showError(error: Error)
}

extension AbleToShowError where Self: UIViewController {

    func showError(error: Error) {
        let controller = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let close = UIAlertAction(title: "Close", style: .default, handler: nil)
        controller.addAction(close)
        present(controller, animated: true, completion: nil)
    }
}
