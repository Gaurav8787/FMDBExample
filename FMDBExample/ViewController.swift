//
//  ViewController.swift
//  FMDBExample
//
//  Created by Gaurav on 13/09/17.
//  Copyright © 2017 Gaurav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let fileURL = try! FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("mydb.db")
        
        let database = FMDatabase(url: fileURL)
        
        guard database.open() else {
            print("Unable to open database")
            return
        }
        
        struct Login {
            var uname:String
            var pwd:String
            
            init(username:String,password:String) {
                self.uname=username
                self.pwd=password
            }
            
        }
        
        do {
            
            let lgn = Login(username:"gaurav",password:"pppp")
            
            try database.executeUpdate("insert into login (username,password) values (?,?)", values: [lgn.uname, lgn.pwd])
            
            let rs = try database.executeQuery("select * from login", values: nil)
            
            while rs.next() {
                if let x = rs.string(forColumn: "username"), let y = rs.string(forColumn: "password") {
                    print("x = \(x); y = \(y);")
                }
            }
            
            database.close()
            
        } catch {
            print("failed: \(error.localizedDescription)")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

