//
//  PopUpEditViewController.swift
//  ShowTik
//
//  Created by HP on 12/12/19.
//  Copyright © 2019 HP. All rights reserved.
//

import UIKit

class PopUpEditViewController: UIViewController {
    @IBOutlet weak var tfNama: UITextField!
    @IBOutlet weak var tfLokasi: UITextField!
    @IBOutlet weak var tfLat: UITextField!
    @IBOutlet weak var tfLong: UITextField!
    
    var db:DBhelper = DBhelper() //inisialisasi db
    
    var apotikk:[Apotik] = [] //memanggil table obat
    
    var id = 0
    var nama = ""
    var lokasi = ""
    var lat = ""
    var long = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        apotikk = db.readApotik()
        tfNama.text = nama
        tfLokasi.text = lokasi
        tfLat.text = lat
        tfLong.text = long
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func klikEdit(_ sender: Any) {
        self.db.updateApotik(nama_apotik: tfNama.text!, lokasi: tfLokasi.text!, latitude: tfLat.text!, longitude: tfLong.text!, Id: id)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newDataNotif"), object: nil)
        dismiss(animated: true)
    }
    
    @IBAction func klikHapus(_ sender: Any) {
        self.db.deleteByIDApotik(id: id)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newDataNotif"), object: nil)
        dismiss(animated: true)
    }
    
}
