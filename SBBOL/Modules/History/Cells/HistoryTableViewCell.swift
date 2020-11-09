//
//  HistoryTableViewCell.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 08.11.2020.
//

import UIKit

final class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var sourceTextLabel: UILabel!
    @IBOutlet weak var translationLabel: UILabel!

    func config(text: String?, translation: String?) {
        sourceTextLabel.text = text
        translationLabel.text = translation
    }
}
