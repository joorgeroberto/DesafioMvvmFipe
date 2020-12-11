//
//  ViewModelProtocol.swift
//  DesafioMvvmFipe
//
//  Created by Jorge Carvalho on 09/12/20.
//

import Foundation
import UIKit

protocol DefaultListViewModelProtocol {
    func loadData(onComplete: @escaping (_ success: Bool) -> Void)
    
    func getNumberOfRows() -> Int
    
    func filterArray(searchQuery: String)
    
    func getNextViewController(index: Int) -> UIViewController
    
    func getTitleForCell(at index: Int) -> String
    
    func getCustomCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    
    func getViewTitle() -> String
}
