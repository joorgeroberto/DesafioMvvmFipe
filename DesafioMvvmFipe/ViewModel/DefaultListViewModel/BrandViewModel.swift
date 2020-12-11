//
//  BrandViewModel.swift
//  DesafioMvvmFipe
//
//  Created by Jorge Carvalho on 09/12/20.
//

import Foundation
import UIKit

class BrandViewModel: DefaultListViewModelProtocol {
    var fipeAPI = FipeAPI()
    var arrayBrands: [BaseClass]?
    var filterArray: [BaseClass]?
    
    func loadData(onComplete: @escaping (Bool) -> Void) {
        fipeAPI.getBrands { (arrayBrands, success) in
            self.arrayBrands = arrayBrands
            self.filterArray = arrayBrands
            onComplete(success)
        }
    }
    
    func getNumberOfRows() -> Int {
        return filterArray?.count ?? 0
    }
    
    func filterArray(searchQuery: String) {
        filterArray = [BaseClass]()
        if !searchQuery.isEmpty {
            filterArray = arrayBrands?.filter { (element) -> Bool in
                element.getName().contains(searchQuery.lowercased())
            }
        } else {
            filterArray!.append(contentsOf: arrayBrands!)
        }
    }
    
    func getNextViewController(index: Int) -> UIViewController {
        let viewModel = CarModelViewModel()
        viewModel.brand = filterArray![index]
        
        //let viewModel = BrandViewModel()
        return DefaultListViewController.getView(viewModel: viewModel)
    }
    
    func getTitleForCell(at index: Int) -> String {
        return filterArray![index].name
    }
    
    func getCustomCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        cell.setup(label: getTitleForCell(at: indexPath.row))
        return cell
    }
    
    func getViewTitle() -> String {
        return "Marcas"
    }
    
    
}
