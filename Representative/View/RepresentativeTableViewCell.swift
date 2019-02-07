//
//  RepresentativeTableViewCell.swift
//  Representative
//
//  Created by Cameron Milliken on 2/7/19.
//  Copyright © 2019 Cameron Milliken. All rights reserved.
//

import UIKit

class RepresentativeTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var officeLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    
    
    
    var representative: Representative? {
        didSet{
            updateViews()
        }
    }
    
    func updateViews() {
        guard let representative = representative else {return}
        nameLabel.text = representative.name
        partyLabel.text = representative.party
        districtLabel.text = representative.district
        officeLabel.text = representative.office
        linkLabel.text = representative.link
        
    }

}
