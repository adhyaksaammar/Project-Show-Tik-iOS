//
//  PopUpEditObatViewController.swift
//  ShowTik
//
//  Created by HP on 13/12/19.
//  Copyright © 2019 HP. All rights reserved.
//

import UIKit

class PopUpEditObatViewController: UIViewController {

    @IBOutlet weak var tfDeskripsi: UITextField!
    @IBOutlet weak var tfNama: UITextField!
    @IBOutlet weak var tfHarga: UITextField!
    @IBOutlet weak var tfTersedia: UITextField!
    
    var db:DBhelper = DBhelper() //inisialisasi db
    
    var obat:[Obat] = [] //memanggil table obat
    
    var id = 0
    var nama = ""
    var deskripsi = ""
    var tersediaDi = ""
    var harga = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tfNama.text = nama
        tfDeskripsi.text = deskripsi
        tfTersedia.text = tersediaDi
        tfHarga.text = harga
        
        obat = db.readObat()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func klikEdit(_ sender: Any) {
        self.db.updateObat(nama: tfNama.text!, deskripsi: tfDeskripsi.text!, tersediaDi: tfTersedia.text!, harga: tfHarga.text!, Id: id)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newDataNotif"), object: nil)
        dismiss(animated: true)
    }
    
    @IBAction func klikHapus(_ sender: Any) {
        self.db.deleteByIDObat(id: id)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newDataNotif"), object: nil)
        dismiss(animated: true)
    }
    
    

}
