//
//  DefaultInfoViewModel.swift
//  DesafioMvvmFipe
//
//  Created by Jorge Carvalho on 09/12/20.
//

import Foundation
import UIKit

class DefaultInfoViewModel {
    var fipeAPI = FipeAPI()
    var brand: BaseClass?
    var model: BaseClass?
    var year: BaseClass?
    var carInformation: CarInformation?
    private var numberOfAtributes = 9
    
    var positionY = 100
    
    func loadData(onComplete: @escaping (Bool) -> Void) {
        fipeAPI.getInformation(brandId: brand!.code!, modelId: model!.code!, yearId: year!.code!) { (carInformation, success) in
            self.carInformation = carInformation
            
            onComplete(success)
        }
    }
    
    func getLabelText(index: Int) -> String {
        switch index {
            case 0:
                return ("Valor: \(carInformation!.valor!)")
            case 1:
                return ("Marca: \(carInformation!.marca!)")
            case 2:
                return ("Modelo: \(carInformation!.modelo!)")
            case 3:
                return ("Ano Modelo: \(carInformation!.anoModelo!)")
            case 4:
                return ("Combustivel: \(carInformation!.combustivel!)")
            case 5:
                return ("Código Fipe: \(carInformation!.codigoFipe!)")
            case 6:
                return ("Mês de referência: \(carInformation!.mesReferencia!)")
            case 7:
                return ("Tipo de veículo: \(carInformation!.tipoVeiculo!)")
            case 8:
                return ("Sigla do Combustível: \(carInformation!.siglaCombustivel!)")
            default:
                return ("Modelo: \(carInformation!.modelo!)")
        }
    }
    
    func getNumberOfAtributes() -> Int {
        return numberOfAtributes - 1
    }
    
    func createLabels(container: UIView) {
        for index in 0...numberOfAtributes {
            let label = UILabel(frame: CGRect(x: 0, y: positionY, width: Int(container.frame.size.width), height: 21))
            positionY += 30
            label.textAlignment = .center
            label.text = getLabelText(index: index)
            
            container.addSubview(label)
        }
    }
    
    func getViewTitle() -> String {
        return "Carro"
    }
}
