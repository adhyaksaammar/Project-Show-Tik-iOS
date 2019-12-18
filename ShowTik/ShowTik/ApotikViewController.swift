//
//  ApotikViewController.swift
//  ShowTik
//
//  Created by HP on 13/12/19.
//  Copyright © 2019 HP. All rights reserved.
//

import UIKit

class ApotikViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tableApotik: UITableView!
    
    //untuk menambah cell
    let cellReuseIdentifier = "cell"
    
    var db:DBhelper = DBhelper() //inisialisasi db
    
    var apotikk:[Apotik] = [] //memanggil table apotik
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableApotik.delegate = self
        tableApotik.dataSource = self
        tableApotik.reloadData()
        
        //untuk membaca dan menampilkan data dari db
        apotikk = db.readApotik()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apotikk.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! ApotikTableViewCell
        cell.labelNama.text = apotikk[indexPath.row].nama_apotik
        cell.labelLokasi.text = apotikk[indexPath.row].lokasi
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "Koordinat", message: "Latitude : \(apotikk[indexPath.row].lat)\nLongitude : \(apotikk[indexPath.row].long)", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        present(alertController, animated: true, completion: nil)
    }

}
