//
//  Representator.swift
//  Sadqa And Zakat Final
//
//  Created by Apple on 06/04/2022.
//

import Foundation
class Representator :Codable {
    var Rid : Int? = 0
    var Name : String? = ""
    var Email : String? = ""
    var Cnic : String? = ""
    var ContactNo : String? = ""
    var Password : String? = ""
    var Address : String? = ""
    var Status : String? = ""
}
class RepresentatorManager {
    //var representator : [Representator] = []
    //var users = Users()
    var representator = Representator()
    var apiwrapper = APIWrapper()
    var decoder = JSONDecoder()
    var encoder = JSONEncoder()
    var Message = ""
    public func addRepresentator(representator:Representator)-> Bool {
        let data = try! encoder.encode(representator)
        let result = apiwrapper.postMethodCall(controllerName: "Representator", actionName: "AddRepresentator", httpBody: data)
        if result.ResponseCode == 200 {
            return true
        }else{
        Message = result.ResponseMessage
            return false
        }
    }
    public func getPendingRepresentator()->[Representator]{
        var representator : [Representator] = []
        let Result = apiwrapper.getMethodCall(controllerName: "Representator", actionName: "GetPendingRepresentators")
        if Result.ResponseCode == 200 {
        //ok
            guard let data = Result.ResponseData else{
            Message = Result.ResponseMessage
                return representator
            }
            representator = try! decoder.decode([Representator].self, from: data)
        }
    
        else{
            Message = Result.ResponseMessage
        }
            return representator
        
    }
}
