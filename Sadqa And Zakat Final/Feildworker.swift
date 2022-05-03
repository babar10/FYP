//
//  Feildworker.swift
//  Sadqa And Zakat Final
//
//  Created by Apple on 06/04/2022.
//

import Foundation
class Feildworker :Codable {
    var Fid : Int? = 0
    var Name : String? = ""
    var Email : String? = ""
    var Cnic : String? = ""
    var ContactNo : String? = ""
    var Password : String? = ""
    var Status : String? = ""
    var Address : String? = ""
    
}
class FeildworkerManager  {
    //var feildworker : [Feildworker] = []
    var feildworker = Feildworker()
    var apiwrapper = APIWrapper()
    var decoder = JSONDecoder()
    var encoder = JSONEncoder()
    var Message = ""
    public func addFeildworker (feildworker:Feildworker)-> Bool {
        let data = try! encoder.encode(feildworker)
        let result = apiwrapper.postMethodCall(controllerName: "Feildworker", actionName: "AddFeildworker", httpBody: data)
        if result.ResponseCode == 200 {
            return true
        }else{
        Message = result.ResponseMessage
            return false
        }
    }
}
