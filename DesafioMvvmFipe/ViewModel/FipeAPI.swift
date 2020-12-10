//
//  FipeAPI.swift
//  DesafioMvvmFipe
//
//  Created by Jorge Carvalho on 09/12/20.
//

import Foundation

class FipeAPI: NSObject {
    var apiManager = APIManager()
    let baseUrl = "https://parallelum.com.br/fipe/api/v1/carros/marcas"
    
    private func parseData(response: Any?) -> [BaseClass]? {
        if let arrayDictionary = response as? [[String: Any]] {
            var array = [BaseClass]()
            for dictionary in arrayDictionary {
                let loadedData = BaseClass(fromDictionary: dictionary)
                array.append(loadedData)
            }
            return array
        }
        return nil
    }
    
    func getBrands(completion: @escaping ([BaseClass]?, Bool) -> Void) {
        apiManager.request(url: "\(baseUrl)") { (response) in
            if let arrayBrands = self.parseData(response: response) {
                completion(arrayBrands, true)
                return
            }
            completion(nil, false)
        }
    }
    
    func getYears(brandId: String, modelId: String,completion: @escaping ([BaseClass]?, Bool) -> Void) {
        apiManager.request(url: "\(baseUrl)/\(brandId)/modelos/\(modelId)/anos") { (response) in
            if let arrayYears = self.parseData(response: response) {
                completion(arrayYears, true)
                return
            }
            completion(nil, false)
        }
    }
    
    func getModels(brandId: String, completion: @escaping ([BaseClass]?, Bool) -> Void) {
        apiManager.request(url: "\(baseUrl)/\(brandId)/modelos") { (response) in
            
            if let dictionaryModel = response as? [String: Any], let arrayDictionary = dictionaryModel["modelos"] as? [[String: Any]] {
                if let arrayModels = self.parseData(response: arrayDictionary) {
                    completion(arrayModels, true)
                    
                    return
                }
                completion(nil, false)
                return
            }
            completion(nil, false)
        }
    }
    
    func getInformation(brandId: String, modelId: String, yearId: String, completion: @escaping (CarInformation?, Bool) -> Void) {
        apiManager.request(url: "\(baseUrl)/\(brandId)/modelos/\(modelId)/anos/\(yearId)") { (response) in
            if let dictionary = response as? [String: Any] {
                let loadedData = CarInformation(fromDictionary: dictionary)
                completion(loadedData, true)
                return
            }
            completion(nil, false)
        }
    }
}
