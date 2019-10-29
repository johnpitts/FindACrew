//
//  PersonTableViewCell.swift
//  FindACrew
//
//  Created by John Pitts on 10/29/19.
//  Copyright © 2019 johnpitts. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    
    var person: Person? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        
        guard let person = person
            /* !person.name.isEmpty is not needed bc there's no user-entry here */ else { return }
        
        nameTextLabel.text = person.name
        genderLabel.text = person.gender
        birthYearLabel.text = person.birthYear
    }
    

}
