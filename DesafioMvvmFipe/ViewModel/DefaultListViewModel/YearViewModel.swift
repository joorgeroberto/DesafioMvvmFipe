//
//  YearViewModel.swift
//  DesafioMvvmFipe
//
//  Created by Jorge Carvalho on 09/12/20.
//

import Foundation
import UIKit

class YearViewModel: DefaultListViewModelProtocol {
    var fipeAPI = FipeAPI()
    var brand: BaseClass?
    var model: BaseClass?
    var arrayYears: [BaseClass]?
    func loadData(onComplete: @escaping (Bool) -> Void) {
        fipeAPI.getYears(brandId: brand!.code!, modelId: model!.code!) { (arrayYears, success) in
            self.arrayYears = arrayYears
            onComplete(success)
        }
    }
    
    func getNumberOfRows() -> Int {
        return arrayYears?.count ?? 0
    }
    
    func getNextViewController(index: Int) -> UIViewController {
        let viewModel = DefaultInfoViewModel()
        viewModel.brand = self.brand
        viewModel.model = self.model
        viewModel.year = arrayYears![index]
        
        return DefaultInfoViewController.getView(viewModel: viewModel)
    }
    
    func getTitleForCell(at index: Int) -> String {
        return arrayYears![index].name
    }
    
    func getCustomCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        cell.setup(label: getTitleForCell(at: indexPath.row))
        return cell
    }
    
    func getViewTitle() -> String {
        return "\(model!.name!)"
    }
    
    
}
