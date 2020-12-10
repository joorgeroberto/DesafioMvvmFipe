//
//  TableViewDelegateDataSource.swift
//  DesafioMvvmFipe
//
//  Created by Jorge Carvalho on 09/12/20.
//

import Foundation
import UIKit

class TableViewDelegateDataSource: NSObject, UITableViewDelegate, UITableViewDataSource  {
    let viewModel: DefaultListViewModelProtocol!
    let navigationController: UINavigationController?
    
    init(viewModel: DefaultListViewModelProtocol, navigationController: UINavigationController) {
        self.viewModel = viewModel
        self.navigationController = navigationController
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(viewModel.getNextViewController(index: indexPath.row), animated: true)
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = viewModel.getCustomCell(tableView: tableView, indexPath: indexPath)
        return cell
    }
    
    
}
