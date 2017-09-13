//
//  AppDelegate.swift
//  FMDBExample
//
//  Created by Gaurav on 13/09/17.
//  Copyright © 2017 Gaurav. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        loadDB()
       // doTatal(num1: 2, num2: 10)
       // doTatal2(num1: 7, num2: 7)
        return true
    }
    
    func doTatal(num1 : Int?, num2: Int?) {
        // nested if statement
        if let fistNum = num1, num1! > 0 {
            if let lastNum = num2, num2! < 50 {
                
                let total = fistNum + lastNum
                print(total)
            }
        }
        // don't allow me to access out of the scope
 //    let  total2 = fistNum + lastNum
    }
    
    
    func doTatal2(num1 : Int?, num2: Int?) {
        //reduce  nested if statement and check positive way not negative way
        guard let fistNum = num1, num1! > 0 else{
            return
        }
        guard  let lastNum = num2, num2! < 50 else {
            return
        }
        // increase my scope which my variable accessible
        let total = fistNum + lastNum
        print(total)
        
    }
    
    func loadDB() {
        
      /*  var userName = "hello"
        
        guard let unwrappedName = userName else {
            return
        }
        
        print("Your username is \(unwrappedName)")
        
        if let unwrappedName = userName {
            print("Your username is \(unwrappedName)")
        } else {
            return
        }*/
        
        // this won't work – unwrappedName doesn't exist here!
   //     print("Your username is \(unwrappedName)")
        
        let fileName = "mydb.db"
        
        let bundleURL = Bundle.main.resourceURL?.appendingPathComponent(fileName)
        
        let filemanager:FileManager = FileManager.default
        let dir = filemanager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let dburl = dir.appendingPathComponent(fileName)
        
        if filemanager.fileExists(atPath: dburl.path){
            print("file exists")
        } else {
            
           do {
                try filemanager.copyItem(at: bundleURL!, to: dburl)
            } catch  let error as NSError {
                print(error)
            }
            
        }
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

