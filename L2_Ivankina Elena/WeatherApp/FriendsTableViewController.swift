//
//  FriendsTableViewController.swift
//  WeatherApp
//
//  Created by Елена Иванкина on 15.01.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    var friends = ["Friend1", "Friend2"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "id0")
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "id0", for: indexPath)

        cell.textLabel?.text = friends[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "id2", sender: UITableViewCell.self)
    }
    


}
