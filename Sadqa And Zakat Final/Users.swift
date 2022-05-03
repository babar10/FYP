//
//  Users.swift
//  Sadqa And Zakat Final
//
//  Created by Apple on 23/03/2022.
//

import Foundation
class Users : Codable{
    var Uid : Int = 0
    var Name : String? = ""
    var Email : String? = ""
    var Cnic : String? = ""
    var ContactNo : String? = ""
    var Role : String? = ""
    var Password : String? = ""
    var Address : String? = ""
}
class UserManager  {
    var users : [Users] = []
    //var users = Users()
    var apiwrapper = APIWrapper()
    var decoder = JSONDecoder()
    var encoder = JSONEncoder()
    var Message = ""
    /* public func GetUsers()->[Users]
    {
       // var users : [Users] = []
        let Result = apiwrapper.getMethodCall(controllerName: "Users", actionName: "GetUsers")
        if Result.ResponseCode == 200 {
        //ok
            guard let data = Result.ResponseData else{
            Message = Result.ResponseMessage
                return users
            }
            users = try! decoder.decode([Users].self, from: data)
        }
    
        else{
            Message = Result.ResponseMessage
        }
            return users
    }*/
    public func addUsers (users:Users)-> Bool {
        let data = try! encoder.encode(users)
        let result = apiwrapper.postMethodCall(controllerName: "Users", actionName: "AddUser", httpBody: data)
        if result.ResponseCode == 200 {
            return true
        }else{
        Message = result.ResponseMessage
            return false
        }
    }
}
 
    

