//
//  AdminApotikTableViewCell.swift
//  ShowTik
//
//  Created by HP on 12/12/19.
//  Copyright © 2019 HP. All rights reserved.
//

import UIKit

class AdminApotikTableViewCell: UITableViewCell {
    @IBOutlet weak var label_nama: UILabel!
    @IBOutlet weak var label_lokasi: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
