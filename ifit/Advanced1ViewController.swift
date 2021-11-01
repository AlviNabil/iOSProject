//
//  Beg1ViewController.swift
//  iFit
//
//  Created by Alvi Ahmmed Nabil on 10/29/21.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseDatabase

class Advanced1ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var refUser: DatabaseReference!
    @IBOutlet var table: UITableView!
    @IBOutlet var topname5: UILabel!
    var databaseHandle: DatabaseHandle?
    var fcount = 0
    
    @IBOutlet weak var buttonConfirm: UIButton!
    
    var list = ["Pullups x25","Diamond Pushup x20","Muscle Up x10","Squat Jumps x25","Leg-Press x20"]
    let array = [20,20,25,30,20]
    var flag = [0,0,0,0,0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate=self
        table.dataSource=self
        refUser = Database.database().reference().child("users")
        topname5.text = "Day \(fcount+1)"

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        cell.textLabel?.text = list[indexPath.row]
        //switch
        let switchView = UISwitch(frame: .zero)
        switchView.setOn(false, animated: true)
        switchView.tag = indexPath.row
        switchView.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
        
        cell.accessoryView = switchView
        
        return cell
    }
    var a:Double = 0.0
    
        
    @objc func switchChanged (_ sender: UISwitch!){
            print("Table row changed \(sender.tag)")
            print("Switch on \(sender.isOn ? "On" : "OFF")")
        var i = sender.tag
        if (sender.isOn){
            flag[i] = 1
        }
        else{
            flag[i] = 0
        }
        a = 0
        for i in 0...4 {
            if flag[i] == 1 {
                a = a + Double(array[i])
            }
        }
        
    }
    func addinfo(){
           let key = Auth.auth().currentUser?.uid
           let user = [
            "CalorieBurned": String(a) as String
           ]
        var st = String(fcount+1)
        refUser.child(key!).child("Advanced").child("Day \(st)").setValue(user)
        if(fcount == 0){
            refUser.child(key!).child("Advanced").child("DayTill").setValue(1)
        }
        databaseHandle = refUser?.child(key!).child("Advanced").child("DayTill").observe(.value, with: { (snapshot) in
            let ivalue = snapshot.value as? Int
           
            var ivalue2 = Int(ivalue!)
            if(ivalue2<self.fcount+1){
                self.refUser.child(key!).child("Advanced").child("DayTill").setValue(self.fcount+1)
            }
        })
       }
       @IBAction func confirmTapped(_ sender: UIButton) {
   
           addinfo()
       }
    
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        buttonConfirm.isEnabled = false
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = list[indexPath.row]
//        let mySwitch = UISwitch()
//
//        mySwitch.addTarget(self, action: #selector(didChangeSwitch(_:)), for: .valueChanged)
//        cell.accessoryView = mySwitch
//        print(indexPath.row)
//
//        return cell
//    }
//    var a=0
//
//    @objc func didChangeSwitch(_ sender: UISwitch) {
//
//        if sender.isOn{
//            print("Switch ON")
//            a = a+1
//
//
//        }
//        else
//        {
//            print("Switch OFF")
//            a = a - 1
//
//        }
//        print(a)
//        if (a == 5) {
//            buttonConfirm.isEnabled = true
//        }
//        else{
//            buttonConfirm.isEnabled = false
//        }
//    }
    
    
    
    

}
