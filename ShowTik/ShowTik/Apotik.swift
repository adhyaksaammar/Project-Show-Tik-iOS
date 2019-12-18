//
//  Apotik.swift
//  ShowTik
//
//  Created by HP on 12/12/19.
//  Copyright © 2019 HP. All rights reserved.
//

import Foundation
class Apotik{
    var id: Int = 0
    var nama_apotik: String = ""
    var lokasi: String = ""
    var lat: String = ""
    var long: String = ""
    
    init(id: Int, nama_apotik: String, lokasi: String, lat: String, long: String) {
        self.id = id
        self.nama_apotik = nama_apotik
        self.lokasi = lokasi
        self.lat = lat
        self.long = long
    }
    
}
