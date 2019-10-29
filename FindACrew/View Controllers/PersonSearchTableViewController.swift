//
//  PersonSearchTableViewController.swift
//  FindACrew
//
//  Created by John Pitts on 10/29/19.
//  Copyright © 2019 johnpitts. All rights reserved.
//

import UIKit

class PersonSearchTableViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var personController = PersonController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return personController.people.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as? PersonTableViewCell else { return  UITableViewCell() }
        
        cell.person = personController.people[indexPath.row]
        
        
        return cell
    }
    


}

extension PersonSearchTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text,
            !searchTerm.isEmpty else { return }                    // always use .isEmpty when a user is involvd in providing data
        
        personController.searchForPeopleWith(searchTerm: searchTerm) {
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.searchBar.text = ""
            }
        }
        
    }
}
