//
//  CarModelViewModel.swift
//  DesafioMvvmFipe
//
//  Created by Jorge Carvalho on 09/12/20.
//

import Foundation
import UIKit

class CarModelViewModel: DefaultListViewModelProtocol {
    var fipeAPI = FipeAPI()
    var brand: BaseClass?
    var arrayModels: [BaseClass]?
    var filterArray: [BaseClass]?
    
    func loadData(onComplete: @escaping (Bool) -> Void) {
        fipeAPI.getModels(brandId: brand!.code!) { (arrayModels, success) in
            self.arrayModels = arrayModels
            self.filterArray = arrayModels
            
            onComplete(success)
        }
    }
    
    func getNumberOfRows() -> Int {
        return filterArray?.count ?? 0
    }
    
    func filterArray(searchQuery: String) {
        filterArray = [BaseClass]()
        if !searchQuery.isEmpty {
            filterArray = arrayModels?.filter { (element) -> Bool in
                element.getName().contains(searchQuery.lowercased())
            }
        } else {
            filterArray!.append(contentsOf: arrayModels!)
        }
    }
    
    func getNextViewController(index: Int) -> UIViewController {
        let viewModel = YearViewModel()
        viewModel.brand = self.brand
        viewModel.model = filterArray![index]
        
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
        return "\(brand!.name!)"
    }
    
    
}
