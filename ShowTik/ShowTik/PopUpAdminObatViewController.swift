//
//  PopUpAdminObatViewController.swift
//  ShowTik
//
//  Created by HP on 13/12/19.
//  Copyright © 2019 HP. All rights reserved.
//

import UIKit

class PopUpAdminObatViewController: UIViewController {
    @IBOutlet weak var labelNama: UITextField!
    @IBOutlet weak var labelTersedia: UITextField!
    @IBOutlet weak var labelHarga: UITextField!
    @IBOutlet weak var labelDeskripsi: UITextField!
    
    var db:DBhelper = DBhelper() //inisialisasi db
    
    var obat:[Obat] = [] //memanggil table obat
    
    override func viewDidLoad() {
        super.viewDidLoad()

        obat = db.readObat()
    }
    
    @IBAction func klikTambah(_ sender: Any) {
        self.db.insertObat(nama: labelNama.text!, deskripsi: labelDeskripsi.text!, tersediaDi: labelTersedia.text!, harga: labelHarga.text!)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newDataNotif"), object: nil)
        dismiss(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
