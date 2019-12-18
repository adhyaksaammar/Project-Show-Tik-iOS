//
//  PopUpObatViewController.swift
//  ShowTik
//
//  Created by HP on 13/12/19.
//  Copyright © 2019 HP. All rights reserved.
//

import UIKit

class PopUpObatViewController: UIViewController {
    @IBOutlet weak var labelNama: UILabel!
    @IBOutlet weak var labelDeskripsi: UILabel!
    @IBOutlet weak var labelTersedia: UILabel!
    @IBOutlet weak var labelHarga: UILabel!
    
    var nama = ""
    var des = ""
    var trsd = ""
    var harga = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelNama.text = nama
        labelDeskripsi.text = des
        labelTersedia.text = trsd
        labelHarga.text = harga
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func klikOK(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
