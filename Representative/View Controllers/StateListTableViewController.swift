//
//  StateListTableViewController.swift
//  Representative
//
//  Created by Cameron Milliken on 2/7/19.
//  Copyright © 2019 Cameron Milliken. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return States.allStates.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)
        let state = States.allStates[indexPath.row]
        cell.textLabel?.text = state
        return cell
    }



    

    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //IIDOO
        if segue.identifier == "toRepDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            let destinationVC = segue.destination as? StateDetailTableViewController
            let state = States.allStates[indexPath.row]
            destinationVC?.state = state
        }
    }
    

}
