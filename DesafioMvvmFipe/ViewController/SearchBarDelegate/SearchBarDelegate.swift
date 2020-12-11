//
//  TableViewDelegateDataSource.swift
//  DesafioMvvmFipe
//
//  Created by Jorge Carvalho on 09/12/20.
//

import Foundation
import UIKit

class SearchBarDelegate: NSObject, UISearchBarDelegate {
    let viewModel: DefaultListViewModelProtocol!
    let tableView: UITableView?
    
    init(viewModel: DefaultListViewModelProtocol, tableView: UITableView) {
        self.viewModel = viewModel
        self.tableView = tableView
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterArray(searchQuery: searchText)
        tableView?.reloadData()
        
    }
    
    
}

