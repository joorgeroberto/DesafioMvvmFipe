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
    
    func loadData(onComplete: @escaping (Bool) -> Void) {
        fipeAPI.getModels(brandId: brand!.code!) { (arrayModels, success) in
            self.arrayModels = arrayModels
            
            onComplete(success)
        }
    }
    
    func getNumberOfRows() -> Int {
        return arrayModels?.count ?? 0
    }
    
    func getNextViewController(index: Int) -> UIViewController {
        let viewModel = YearViewModel()
        viewModel.brand = self.brand
        viewModel.model = arrayModels![index]
        
        return DefaultListViewController.getView(viewModel: viewModel)
    }
    
    func getTitleForCell(at index: Int) -> String {
        return arrayModels![index].name
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
