//
//  PopUpAdminApotikViewController.swift
//  ShowTik
//
//  Created by HP on 12/12/19.
//  Copyright © 2019 HP. All rights reserved.
//

import UIKit

class PopUpAdminApotikViewController: UIViewController {
    
    @IBOutlet weak var tf_nama: UITextField!
    @IBOutlet weak var tf_lokasi: UITextField!
    @IBOutlet weak var tf_lat: UITextField!
    @IBOutlet weak var tf_long: UITextField!
    
    var db:DBhelper = DBhelper() //inisialisasi db
    
    var apotikk:[Apotik] = [] //memanggil table apotik
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //untuk membaca dan menampilkan data dari db
        apotikk = db.readApotik()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func klikTambah(_ sender: Any) {
        let nama = tf_nama.text!
        let lokasi = tf_lokasi.text!
        let lat = tf_lat.text!
        let long = tf_long.text!
        self.db.insertApotik(nama_apotik: nama, lokasi: lokasi, latitude: lat, longitude: long)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newDataNotif"), object: nil)
        dismiss(animated: true)
    }
    
}
