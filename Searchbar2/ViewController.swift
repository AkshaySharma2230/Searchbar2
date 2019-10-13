//
//  ViewController.swift
//  Searchbar2
//
//  Created by OmninosiOS on 1/2/19.
//  Copyright © 2019 omninos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    
    var names = ["Akshay","Sharma","Ashok","Vipan","Anuj","Ajay","Karan","Raghav","Shubham","Mittal","Chadha","Ghai"]
    var nameentry = [String]()
    var searching = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            return nameentry.count
        }
        else{
        return names.count
    }
}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        if searching{
            
            cell?.textLabel?.text = nameentry[indexPath.row]
        }else{
            cell?.textLabel?.text = names[indexPath.row]
        }
         return cell!
    }
}

extension ViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        nameentry = names.filter({$0.prefix(searchText.count) == searchText})
        searching = true
        tableview.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.searchbar.showsCancelButton = true
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchbar.showsCancelButton = false
        searchbar.text = ""
        searchbar.resignFirstResponder()
    }
}
