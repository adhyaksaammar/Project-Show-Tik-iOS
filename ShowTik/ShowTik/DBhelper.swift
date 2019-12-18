//
//  DBhelper.swift
//  ShowTik
//
//  Created by HP on 12/12/19.
//  Copyright © 2019 HP. All rights reserved.
//

import Foundation
import SQLite3

class DBhelper{
    
    // Open database
    init(){
        db = openDatabase()
        crateTableApotik()
    }
    
    let dbPath: String = "aptoik.sqlite"
    var db:OpaquePointer?
    
    func openDatabase() -> OpaquePointer? {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(dbPath)
        var db: OpaquePointer? = nil
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK
        {
            print("error opening database")
            return nil
        }
        else
        {
            print("Successfully opened connection to database at \(dbPath)")
            return db
        }
    }
    
    // Data apotik
    func crateTableApotik(){
        let createTableString = "CREATE TABLE IF NOT EXISTS apotik(Id INTEGER PRIMARY KEY AUTOINCREMENT, nama_apotik TEXT, lokasi TEXT, latitude TEXT, longitude TEXT);"
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) == SQLITE_DONE
            {
                print("Apotik table created.")
            } else {
                print("Apotik could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    func insertApotik(nama_apotik: String, lokasi: String, latitude: String, longitude: String)
    {
        let insertStatementString = "INSERT INTO apotik(nama_apotik, lokasi, latitude, longitude) VALUES(?, ?, ?, ?);"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 1, (nama_apotik as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (lokasi as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (latitude as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, (longitude as NSString).utf8String, -1, nil)
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    
    func readApotik() -> [Apotik] {
        let queryStatementString = "SELECT * FROM apotik;"
        var queryStatement: OpaquePointer? = nil
        var psns : [Apotik] = [] //setting structure table
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                //read in table
                let id = sqlite3_column_int(queryStatement, 0)
                let nama_apotik = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let lokasi = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let latitude = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                let longitude = String(describing: String(cString: sqlite3_column_text(queryStatement, 4)))
                psns.append(Apotik(id: Int(id), nama_apotik: nama_apotik, lokasi: lokasi, lat: latitude, long: longitude))
                print("Query Result:")
                print("\(id) | \(nama_apotik) | \(lokasi) | \(latitude) | \(longitude)")
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return psns
    }
    
    func updateApotik(nama_apotik: String, lokasi: String, latitude: String, longitude: String,Id: Int)
    {
        let insertStatementString = "UPDATE apotik SET nama_apotik=?, lokasi=?, latitude=?, longitude=? WHERE Id=?;"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 1, (nama_apotik as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (lokasi as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (latitude as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, (longitude as NSString).utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 5, Int32(Id))
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    
    func deleteByIDApotik(id:Int) {
        let deleteStatementStirng = "DELETE FROM apotik WHERE Id = ?;"
        var deleteStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, deleteStatementStirng, -1, &deleteStatement, nil) == SQLITE_OK {
            sqlite3_bind_int(deleteStatement, 1, Int32(id))
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("Successfully deleted row.")
            } else {
                print("Could not delete row.")
            }
        } else {
            print("DELETE statement could not be prepared")
        }
        sqlite3_finalize(deleteStatement)
    }
    
    // Data obat
    func crateTableObat(){
        let createTableString = "CREATE TABLE IF NOT EXISTS obat(Id INTEGER PRIMARY KEY AUTOINCREMENT, nama TEXT, deskripsi TEXT, tersediaDi TEXT, harga TEXT);"
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) == SQLITE_DONE
            {
                print("Obat table created.")
            } else {
                print("Obat table could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    func insertObat(nama: String, deskripsi: String, tersediaDi: String, harga: String)
    {
        let insertStatementString = "INSERT INTO obat(nama, deskripsi, tersediaDi, harga) VALUES(?, ?, ?, ?);"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 1, (nama as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (deskripsi as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (tersediaDi as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, (harga as NSString).utf8String, -1, nil)
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    
    func readObat() -> [Obat] {
        let queryStatementString = "SELECT * FROM obat;"
        var queryStatement: OpaquePointer? = nil
        var psns : [Obat] = [] //setting structure table
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                //read in table
                let id = sqlite3_column_int(queryStatement, 0)
                let nama = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let deskripsi = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let tersediaDi = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                let harga = String(describing: String(cString: sqlite3_column_text(queryStatement, 4)))
                psns.append(Obat(Id: Int(id), nama: nama, deskripsi: deskripsi, tersediaDi: tersediaDi, harga: harga))
                print("Query Result:")
                print("\(id) | \(nama) | \(deskripsi) | \(tersediaDi) | \(harga)")
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return psns
    }
    
    func updateObat(nama: String, deskripsi: String, tersediaDi: String, harga: String, Id: Int)
    {
        let insertStatementString = "UPDATE obat SET nama=?, deskripsi=?, tersediaDi=?, harga=? WHERE Id=?;"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 1, (nama as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (deskripsi as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (tersediaDi as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, (harga as NSString).utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 5, Int32(Id))
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    
    func deleteByIDObat(id:Int) {
        let deleteStatementStirng = "DELETE FROM obat WHERE Id = ?;"
        var deleteStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, deleteStatementStirng, -1, &deleteStatement, nil) == SQLITE_OK {
            sqlite3_bind_int(deleteStatement, 1, Int32(id))
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("Successfully deleted row.")
            } else {
                print("Could not delete row.")
            }
        } else {
            print("DELETE statement could not be prepared")
        }
        sqlite3_finalize(deleteStatement)
    }
    
    func createTableUsers() {
        let createTableString = "CREATE TABLE IF NOT EXISTS users(Id INTEGER PRIMARY KEY AUTOINCREMENT, nama TEXT, katasandi TEXT);"
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) == SQLITE_DONE
            {
                print("Users table created.")
            } else {
                print("Users table could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    func insertUsers(nama: String, katasandi: String)
    {
        let insertStatementString = "INSERT INTO users(nama, katasandi) VALUES(?, ?);"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 1, (nama as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (katasandi as NSString).utf8String, -1, nil)
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    
    func readUsers() -> [Users]{
        let queryStatementString = "SELECT * FROM users;"
        var queryStatement: OpaquePointer? = nil
        var usr: [Users] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                //read in table
                let id = sqlite3_column_int(queryStatement, 0)
                let nama = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let katasandi = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                usr.append(Users(Id: Int(id), nama: nama, katasandi: katasandi))
                print("Query Result:")
                print("\(id) | \(nama) | \(katasandi)")
            }
            
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return usr
    }
    
    func readUsers(nama: String, katasandi: String) -> [Users]{
        let queryStatementString = "SELECT * FROM users WHERE nama=? AND katasandi=?;"
        var queryStatement: OpaquePointer? = nil
        var usr: [Users] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(queryStatement, 1, (nama as NSString).utf8String, -1, nil)
            sqlite3_bind_text(queryStatement, 2, (katasandi as NSString).utf8String, -1, nil)
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                //read in table
                let id = sqlite3_column_int(queryStatement, 0)
                let namaa = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let katasandii = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                usr.append(Users(Id: Int(id), nama: namaa, katasandi: katasandii))
                print("Query Result:")
                print("\(id) | \(namaa) | \(katasandii)")
            }
            
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return usr
    }
    
}
