//
//  APIManager.swift
//  DesafioMvvmFipe
//
//  Created by Jorge Carvalho on 09/12/20.
//

import Foundation
import Alamofire

class APIManager {
    typealias completion <T> = (_ result: T, _ failure: Bool) -> Void
    
    func request(url: String, onComplete: @escaping (_ response: Any?) -> Void) {
        AF.request(url).responseJSON { response in
            onComplete(response.value)
        }
    }
}
