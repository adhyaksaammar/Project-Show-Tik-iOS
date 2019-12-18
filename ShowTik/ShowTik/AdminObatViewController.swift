//
//  AdminObatViewController.swift
//  ShowTik
//
//  Created by HP on 12/12/19.
//  Copyright © 2019 HP. All rights reserved.
//

import UIKit

class AdminObatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableObat: UITableView!
    
    //untuk menambah cell
    let cellReuseIdentifier = "cell"
    
    var db:DBhelper = DBhelper() //inisialisasi db
    
    var obat:[Obat] = [] //memanggil table obat
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableObat.delegate = self
        tableObat.dataSource = self
        tableObat.reloadData()
        
        //untuk membaca dan menampilkan data dari db
        obat = db.readObat()
        db.crateTableObat()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.refresh), name: NSNotification.Name(rawValue: "newDataNotif"), object: nil)
    }

    @objc func refresh() {
        self.viewDidLoad()
        self.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return obat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableObat.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! AdminObatTableViewCell
        
        cell.labelNama.text = obat[indexPath.row].nama
        cell.labelHarga.text = obat[indexPath.row].harga
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "editObatSegue", sender: self)
    }
    
    override
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "editObatSegue") {
            let editPopup = segue.destination as! PopUpEditObatViewController
            let indexPath = self.tableObat.indexPathForSelectedRow!
            editPopup.id = obat[indexPath.row].Id
            editPopup.nama = obat[indexPath.row].nama
            editPopup.deskripsi = obat[indexPath.row].deskripsi
            editPopup.tersediaDi = obat[indexPath.row].tersediaDi
            editPopup.harga = obat[indexPath.row].harga
            self.tableObat.deselectRow(at: indexPath, animated: true)
        }
    }
    @IBAction func LogoutPress(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
