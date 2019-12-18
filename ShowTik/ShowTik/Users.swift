//
//  Users.swift
//  ShowTik
//
//  Created by HP on 13/12/19.
//  Copyright © 2019 HP. All rights reserved.
//

import Foundation
class Users
{
    var Id: Int = 0
    var nama: String = ""
    var katasandi: String = ""
    
    init(Id:Int, nama:String, katasandi:String)
    {
        self.Id = Id
        self.nama = nama
        self.katasandi = katasandi
        
    }
}
