//
//  ChecklistViewController.swift
//  Checklists
//
//  Created by Mondale on 1/21/20.
//  Copyright © 2020 Mondale. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Determines the number of cells to display
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    // Returns a copy of the prototype cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        // Force casting the view with tag: 1000 as a UILabel
        let label = cell.viewWithTag(1000) as! UILabel
        if indexPath.row == 0 {
            label.text = "Walk the dog"
        } else if indexPath.row == 1 {
            label.text = "Brush my teeth"
        } else if indexPath.row == 2 {
            label.text = "Learn iOS Development"
        } else if indexPath.row == 3 {
            label.text = "Soccer Practice"
        } else if indexPath.row == 4 {
            label.text = "Eat icecream"
        }
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
