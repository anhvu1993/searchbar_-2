//
//  ViewController.swift
//  DemoSearchbar_2
//
//  Created by Anh vũ on 5/17/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var number = [Int](1...100)
    var searchController = UISearchController(searchResultsController: searchResultControllor.instance)
    override func viewDidLoad() {
        super.viewDidLoad()
        definesPresentationContext = true
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return number.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let datanumber = number[indexPath.row]
        cell.textLabel?.text = String(datanumber)
        return cell
    }
}


extension TableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text ?? ""
        print(searchText)
        let searchResultVc = (searchController.searchResultsController as! searchResultControllor)
//        searchResultVc.searchResult = number.filter{ item in
//            ("\(item)").contains(searchText)
//        }
        searchResultVc.searchResult = number.filter { "\($0)".contains(searchText)}
        searchResultVc.tableView.reloadData()
    }
}





class searchResultControllor: UITableViewController {
    static var instance: searchResultControllor {
        let storyboar = UIStoryboard(name: "Main", bundle: nil)
        return (storyboar.instantiateViewController(withIdentifier: "SearchResultControllor") as! searchResultControllor)
    }
    var searchResult = [Int]()
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult.count

    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = ("\(searchResult[indexPath.row])")
        return cell
    }

}
