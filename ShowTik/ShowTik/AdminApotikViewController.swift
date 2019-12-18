//
//  AdminApotikViewController.swift
//  ShowTik
//
//  Created by HP on 12/12/19.
//  Copyright © 2019 HP. All rights reserved.
//

import UIKit

class AdminApotikViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableApotik: UITableView!
    
    //untuk menambah cell
    let cellReuseIdentifier = "cell"
    
    var db:DBhelper = DBhelper() //inisialisasi db
    
    var apotikk:[Apotik] = [] //memanggil table apotik
    var id: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableApotik.delegate = self
        tableApotik.dataSource = self
        tableApotik.reloadData()
        
        //untuk membaca dan menampilkan data dari db
        apotikk = db.readApotik()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.refresh), name: NSNotification.Name(rawValue: "newDataNotif"), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apotikk.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "editApotikSegue", sender: self)
    }

    override
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "editApotikSegue") {
            let editPopup = segue.destination as! PopUpEditViewController
            let indexPath = self.tableApotik.indexPathForSelectedRow!
            editPopup.id = apotikk[indexPath.row].id
            editPopup.nama = apotikk[indexPath.row].nama_apotik
            editPopup.lokasi = apotikk[indexPath.row].lokasi
            editPopup.lat = apotikk[indexPath.row].lat
            editPopup.long = apotikk[indexPath.row].long
            self.tableApotik.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! AdminApotikTableViewCell
        cell.label_nama.text = apotikk[indexPath.row].nama_apotik
        cell.label_lokasi.text = apotikk[indexPath.row].lokasi
        return cell
    }
    
    @objc func refresh() {
        self.viewDidLoad()
        self.viewDidLoad()
    }
    
    @IBAction func LogoutPress2(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
