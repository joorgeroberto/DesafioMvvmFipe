//
//  CustomCell.swift
//  DesafioMvvmFipe
//
//  Created by Jorge Carvalho on 09/12/20.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var cellLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup(label: String) {
        cellLabel.text = label
    }
}
