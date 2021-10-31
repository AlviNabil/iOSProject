//
//  beginnerViewController.swift
//  iFit
//
//  Created by Alvi Ahmmed Nabil on 10/29/21.
//

import UIKit

class beginnerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var count = 0
    
    
    var list = ["Day 1","Day 2","Day 3","Day 4","Day 5","Day 6","Day 7","Day 8","Day 9","Day 10","Day 11","Day 12","Day 13","Day 14"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "days")
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        count = indexPath.row
        if (count==0 || count==2 || count==4 || count==6 || count==8 || count==10 || count==12){
            performSegue(withIdentifier: "exercise", sender: self)
        }
        if (count==1 || count==3 || count==5 || count==7 || count==9 || count==11 || count==13){
            performSegue(withIdentifier: "exercise1", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
}
