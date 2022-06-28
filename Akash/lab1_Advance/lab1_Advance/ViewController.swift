//
//  ViewController.swift
//  lab1_Advance
//
//  Created by student on 13/06/22.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var table1 : UITableView!
    @IBOutlet var label1 : UILabel!
    
    var macOSDevices : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        macOSDevices = ["1","2","3"]
        
        table1.delegate = self
        table1.dataSource = self
    
    }
    
    //tableview protocol methods
    
    // no of sections to be mentioned here
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    //no of rows mentioned here
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return macOSDevices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifer1", for: indexPath)
        
        
        cell.textLabel?.text = macOSDevices[indexPath.row]
        cell.backgroundColor = .green
        cell.accessoryType = .detailDisclosureButton
        
        return cell
        
    }
    
    

}


