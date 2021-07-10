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
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
    }
    
    // MARK: - Helpers
    
    func configureTableView(){
        view.backgroundColor = .white
        
        tableView.register(UserCell.self, forCellReuseIdentifier: reuserIdentifier)
        tableView.rowHeight = 64
    }
}



// MARK: - UITableViewDataSoucre
extension SearchController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuserIdentifier, for: indexPath)
        
        return cell
    }
}
