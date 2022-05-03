//
//  Admin.swift
//  Sadqa And Zakat Final
//
//  Created by Apple on 05/04/2022.
//

import Foundation
class Admin : Codable {
    var Aid : Int? = 0
    var Name : String? = ""
    var Email : String? = ""
    var Cnic : String? = ""
    var ContactNo : String? = ""
    var Password : String? = ""
    var Address : String? = ""
    

}
class AdminManager {
   // var admin : [Admin] = []
    var admin = Admin()
    var apiwrapper = APIWrapper()
    var decoder = JSONDecoder()
    var encoder = JSONEncoder()
    var Message = ""
    public func addAdmin (admin:Admin)-> Bool {
        let data = try! encoder.encode(admin)
        let result = apiwrapper.postMethodCall(controllerName: "Admin", actionName: "AddAdmin", httpBody: data)
        if result.ResponseCode == 200 {
            return true
        }else{
        Message = result.ResponseMessage
            return false
        }
    }
    
}
