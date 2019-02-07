//
//  StateDetailTableViewController.swift
//  Representative
//
//  Created by Cameron Milliken on 2/7/19.
//  Copyright © 2019 Cameron Milliken. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {
    
    
    var representative: [Representative] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    var state: String?

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return representative.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repCell", for: indexPath) as! RepresentativeTableViewCell
        let representative = self.representative[indexPath.row]
        cell.representative = representative

        return cell
    }


}
