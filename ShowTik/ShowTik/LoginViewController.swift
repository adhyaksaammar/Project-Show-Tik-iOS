//
//  LoginViewController.swift
//  ShowTik
//
//  Created by HP on 12/12/19.
//  Copyright © 2019 HP. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    var db:DBhelper = DBhelper() //inisialisasi db
    var users:[Users] = [] //memanggil table users
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        db.createTableUsers()
        db.readUsers()
        db.insertUsers(nama: "Admin", katasandi: "123")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func klikLogin(_ sender: Any) {
        let nama: String = Username.text!
        let katasandi: String = Password.text!
        
        if nama.isEmpty || katasandi.isEmpty {
            showAlert(Title: "Peringatan", Message: "Mohon untuk diisi Nama dan Katasandi")
        }
        
        var masuk = db.readUsers(nama: nama, katasandi: katasandi)
        print(masuk)
        if masuk.count > 0 {
            performSegue(withIdentifier: "loginSegue", sender: self)
        }else {
            showAlert(Title: "Peringatan", Message: "Nama dan Katasandi salah")
        }
    }
    
    func showAlert(Title title:String, Message message: String){
        let alertController = UIAlertController(title: title,message:message, preferredStyle:UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title:"OK", style : UIAlertActionStyle.default, handler:nil))
        
        present(alertController, animated:true,completion: nil)
    }
    
}
