//
//  ViewController.swift
//  DesafioMvvmFipe
//
//  Created by Jorge Carvalho on 09/12/20.
//

//Primeiro listar as marcas: https://parallelum.com.br/fipe/api/v1/carros/marcas
//Dai listar os Modelos da marca selecionada: https://parallelum.com.br/fipe/api/v1/carros/marcas/21/modelos
//Quando selecionar um modelo, tem que escolher o ano: https://parallelum.com.br/fipe/api/v1/carros/marcas/21/modelos/437/anos
//Quando escolher o ano, finalmente vai poder exibir as informações do veículo: https://parallelum.com.br/fipe/api/v1/carros/marcas/21/modelos/437/anos/1987-1
//https://veiculos.fipe.org.br/

import UIKit

class DefaultListViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    var viewModel: DefaultListViewModelProtocol!
    @IBOutlet weak var tableView: UITableView!
    var tableViewDelegateDataSource: TableViewDelegateDataSource?
    var searchBarDelegate: SearchBarDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.getViewTitle()
        loadData()
        
    }

    func loadData() {
        viewModel.loadData(onComplete: { (success) in
            self.configureTableView()
        })
    }
    
    static func getView(viewModel: DefaultListViewModelProtocol) -> DefaultListViewController {
        let viewDefault = UIStoryboard(name: "DefaultList", bundle: nil).instantiateInitialViewController() as! DefaultListViewController
        viewDefault.viewModel = viewModel
        return viewDefault
    }
    
    func configureTableView() {
        self.tableViewDelegateDataSource = TableViewDelegateDataSource(viewModel: self.viewModel, navigationController: self.navigationController!)
        self.searchBarDelegate = SearchBarDelegate(viewModel: self.viewModel, tableView: tableView)
        self.tableView.delegate = tableViewDelegateDataSource
        self.tableView.dataSource = tableViewDelegateDataSource
        self.searchBar.delegate = searchBarDelegate
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }

    }

}

