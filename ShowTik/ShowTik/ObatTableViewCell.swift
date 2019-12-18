//
//  ObatTableViewCell.swift
//  ShowTik
//
//  Created by HP on 13/12/19.
//  Copyright © 2019 HP. All rights reserved.
//

import UIKit

class ObatTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNama: UILabel!
    @IBOutlet weak var lblHarga: UILabel!
    @IBOutlet weak var labelHarga: UILabel!
    @IBOutlet weak var labelNama: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
