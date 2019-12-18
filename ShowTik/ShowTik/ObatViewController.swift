//
//  ObatViewController.swift
//  ShowTik
//
//  Created by HP on 13/12/19.
//  Copyright © 2019 HP. All rights reserved.
//

import UIKit

class ObatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableObat: UITableView!
    
    //untuk menambah cell
    let cellReuseIdentifier = "cell"
    
    var db:DBhelper = DBhelper() //inisialisasi db
    
    var obat:[Obat] = [] //memanggil table obat
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableObat.delegate = self
        tableObat.dataSource = self
        tableObat.reloadData()
        
        //untuk membaca dan menampilkan data dari db
        obat = db.readObat()
        db.crateTableObat()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return obat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableObat.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! ObatTableViewCell
        
        cell.lblNama.text = obat[indexPath.row].nama
        cell.labelHarga.text = obat[indexPath.row].harga
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "obatSegue", sender: self)
    }
    
    override
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "obatSegue") {
            let editPopup = segue.destination as! PopUpObatViewController
            let indexPath = self.tableObat.indexPathForSelectedRow!
            editPopup.nama = obat[indexPath.row].nama
            editPopup.des = obat[indexPath.row].deskripsi
            editPopup.trsd = obat[indexPath.row].tersediaDi
            editPopup.harga = obat[indexPath.row].harga
            self.tableObat.deselectRow(at: indexPath, animated: true)
        }
    }

}
