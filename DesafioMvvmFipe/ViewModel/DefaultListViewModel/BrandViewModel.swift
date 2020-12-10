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
    
    func loadData(onComplete: @escaping (Bool) -> Void) {
        fipeAPI.getBrands { (arrayBrands, success) in
            self.arrayBrands = arrayBrands
            onComplete(success)
        }
    }
    
    func getNumberOfRows() -> Int {
        return arrayBrands?.count ?? 0
    }
    
    func getNextViewController(index: Int) -> UIViewController {
        let viewModel = CarModelViewModel()
        viewModel.brand = arrayBrands![index]
        
        //let viewModel = BrandViewModel()
        return DefaultListViewController.getView(viewModel: viewModel)
    }
    
    func getTitleForCell(at index: Int) -> String {
        return arrayBrands![index].name
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
