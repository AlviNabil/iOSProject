//
//  beginnerViewController.swift
//  iFit
//
//  Created by Alvi Ahmmed Nabil on 10/29/21.
//

import UIKit

class IntermediateViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var count = 0
    @IBOutlet var IntermediateName: UILabel!
    
    
    var list = ["Day 1","Day 2","Day 3","Day 4","Day 5","Day 6","Day 7","Day 8","Day 9","Day 10","Day 11","Day 12","Day 13","Day 14","Day 15","Day 16","Day 17","Day 18","Day 19","Day 20","Day 21"]
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
        if (count==0 || count==2 || count==4 || count==6 || count==8 || count==10 || count==12 || count==14 || count==16 || count==18 || count==20){
            performSegue(withIdentifier: "exercise2", sender: self)
        }
        if (count==1 || count==3 || count==5 || count==7 || count==9 || count==11 || count==13 || count==15 || count==17 || count==19 || count==21) {
            performSegue(withIdentifier: "exercise3", sender: self)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(count == -1200){
            count = 0
        }
        else if(count%2==1){
            var vc = segue.destination as! Int2ViewController
            vc.fcount = count
        }
        else{
            var vc = segue.destination as! Int1ViewController
            vc.fcount = count
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IntermediateName.text = "Intermediate Level"
        // Do any additional setup after loading the view.
    }
    @IBAction func backTapped(_ sender: UIButton) {
        count = -1200
    }
    

    
}
