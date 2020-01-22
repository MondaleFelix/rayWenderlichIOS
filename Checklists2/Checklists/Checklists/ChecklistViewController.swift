//
//  ChecklistViewController.swift
//  Checklists
//
//  Created by Mondale on 1/21/20.
//  Copyright © 2020 Mondale. All rights reserved.
//

import UIKit

class ChecklistViewController : UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        return cell
    }
}
