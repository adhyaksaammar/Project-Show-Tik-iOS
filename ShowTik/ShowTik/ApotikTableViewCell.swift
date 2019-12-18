//
//  ApotikTableViewCell.swift
//  ShowTik
//
//  Created by HP on 13/12/19.
//  Copyright © 2019 HP. All rights reserved.
//

import UIKit

class ApotikTableViewCell: UITableViewCell {
    @IBOutlet weak var labelNama: UILabel!
    @IBOutlet weak var labelLokasi: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
