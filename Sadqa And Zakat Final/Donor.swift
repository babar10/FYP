//
//  Donor.swift
//  Sadqa And Zakat Final
//
//  Created by Apple on 06/04/2022.
//

import Foundation
class Donor : Codable{
    var Did : Int? = 0
    var Name : String? = ""
    var Email : String? = ""
    var Cnic : String? = ""
    var ContactNo : String? = ""
    var Password : String? = ""
    var Address : String? = ""
}
class DonorManager {
    var donor = Donor()
    //var users = Users()
    var apiwrapper = APIWrapper()
    var decoder = JSONDecoder()
    var encoder = JSONEncoder()
    var Message = ""
    public func addDonor (donor:Donor)-> Bool {
        let data = try! encoder.encode(donor)
        let result = apiwrapper.postMethodCall(controllerName: "Donor", actionName: "AddDonor", httpBody: data)
        if result.ResponseCode == 200 {
            return true
        }else{
        Message = result.ResponseMessage
            return false
        }
    }
    
}


