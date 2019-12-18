//
//  Obat.swift
//  ShowTik
//
//  Created by HP on 13/12/19.
//  Copyright © 2019 HP. All rights reserved.
//

import Foundation

class Obat{
    var Id: Int = 0
    var nama: String = ""
    var deskripsi: String = ""
    var tersediaDi: String = ""
    var harga:String = ""
    
    init(Id: Int, nama: String, deskripsi: String, tersediaDi: String, harga: String) {
        self.Id = Id
        self.nama = nama
        self.deskripsi = deskripsi
        self.tersediaDi = tersediaDi
        self.harga = harga
    }
}
