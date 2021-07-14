//
//  SearchController.swift
//  insta
//
//  Created by baegteun on 2021/06/29.
//

import UIKit


private let reuserIdentifier = "UserCell"

class SearchController:UITableViewController{
    
    // MARK: - Properties
    
    private var users = [User]()
    private var filteredUser = [User]()
    private let searchController = UISearchController(searchResultsController: nil)
    private var inSearchMode: Bool {
        return searchController.isActive && !searchController.searchBar.text!.isEmpty
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchController()
        configureTableView()
        fetchUsers()
        
    }
    
    // MARK: - API
    func fetchUsers() {
        UserService.fetchUsers { users in
            self.users = users
            self.tableView .reloadData()
        }
    }
    
    
    
    // MARK: - Helpers
    
    func configureTableView(){
        view.backgroundColor = .white
        
        tableView.register(UserCell.self, forCellReuseIdentifier: reuserIdentifier)
        tableView.rowHeight = 64
    }
    
    func configureSearchController(){
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = false
    }
}




// MARK: - UITableViewDataSoucre
extension SearchController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inSearchMode ? filteredUser.count : users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuserIdentifier, for: indexPath) as! UserCell
        let user = inSearchMode ? filteredUser[indexPath.row] : users[indexPath.row]
        cell.viewModel = UserCellViewModel(user: user)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension SearchController{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = inSearchMode ? filteredUser[indexPath.row] : users[indexPath.row]
        let controller = ProfileController(user: user)
        navigationController?.pushViewController(controller, animated: true)
        
    }
}

extension SearchController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text?.lowercased() else { return }
        filteredUser = users.filter({
            $0.username.contains(searchText) ||
                $0.fullname.lowercased().contains(searchText)
        })
        print("DEBUG \(filteredUser)")
        self.tableView.reloadData()
    }
    
    
}
