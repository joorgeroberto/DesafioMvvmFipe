//
//  DefaultInfoViewController.swift
//  DesafioMvvmFipe
//
//  Created by Jorge Carvalho on 09/12/20.
//

import UIKit

class DefaultInfoViewController: UIViewController {
    var viewModel: DefaultInfoViewModel!
    @IBOutlet weak var labelsContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.getViewTitle()
        loadData()
    }
    
    func loadData() {
        viewModel.loadData(onComplete: { (success) in
            self.viewModel.createLabels(container: self.labelsContainer)
        })
    }
    
    static func getView(viewModel: DefaultInfoViewModel) -> DefaultInfoViewController {
        let viewDefault = UIStoryboard(name: "DefaultInfo", bundle: nil).instantiateInitialViewController() as! DefaultInfoViewController
        viewDefault.viewModel = viewModel
        return viewDefault
    }
}
