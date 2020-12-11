//
//  BaseClass.swift
//  DesafioMvvmFipe
//
//  Created by Jorge Carvalho on 09/12/20.
//

import Foundation


class BaseClass : NSObject, NSCoding{

    var code : String!
    var name : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        name = dictionary["nome"] as? String
        if let code = dictionary["codigo"] as? String {
            self.code = code
        } else {
            self.code = "\(dictionary["codigo"]!)"
        }
    }
    
    func getName() -> String {
        return "\(String(describing: name))".lowercased()
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if code != nil{
            dictionary["code"] = code
        }
        if name != nil{
            dictionary["name"] = name
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         code = aDecoder.decodeObject(forKey: "code") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if code != nil{
            aCoder.encode(code, forKey: "code")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }

    }

}
