//
//  LoginViewController.swift
//  Sadqa And Zakat Final
//
//  Created by Apple on 23/03/2022.
//

import UIKit
class LoginViewController: UIViewController ,UIPickerViewDelegate,UIPickerViewDataSource {
   // let um = UserManager()
   // var admin : [Admin] = []
    //var admin = Admin()
    let fyp = APIWrapper()
   // public static var loggedInUser: Admin!
    @IBOutlet weak var Selected: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    var selectedRole: String?
    let userRole = ["Admin","Donor","FieldWorker","Representor"]
    @IBOutlet weak var PickerViewRole: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return userRole.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return userRole[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRole = userRole[row]
        return Selected.text=selectedRole
        
    }
    
    @IBAction func LogInAccount(_ sender: Any) {
      // let user = UserManager()
        if(txtEmail.text == "" && txtPassword.text == "" && Selected.text == "")
        {
            let alert = UIAlertController(title: "Login", message: "Enter your Detail To Login.", preferredStyle: UIAlertController.Style.alert)

                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                    // show the alert
                    self.present(alert, animated: true, completion: nil)
        }
        if (Selected.text == "Admin"){
        let actionPath = "GetAdmin?Email=\(txtEmail.text!)&Password=\(txtPassword.text!)"
            let result = fyp.getMethodCall(controllerName: "Admin", actionName: actionPath)
            
            do{
                if result.ResponseCode == 200 {
                    if let returnData = String(data: result.ResponseData!, encoding: .utf8) {
                        print(returnData)
                        let decoder = JSONDecoder()
                        let response = try! decoder.decode(Admin.self, from: result.ResponseData!)
                          print ("Login Successfully")
                         print (response)
                        let controller=storyboard?.instantiateViewController (withIdentifier: "AdminDashBoard")
                        self.present(controller!, animated: true, completion: nil)
                    }
                  
                }
                else
                {
                    let alert = UIAlertController(title: "Account", message: "Account doestn't exist.", preferredStyle: UIAlertController.Style.alert)

                            // add an action (button)
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                            // show the alert
                            self.present(alert, animated: true, completion: nil)
                  //print("Account doestn't exist")
                }
        }
             
        }
          else if (Selected.text == "FieldWorker"){
            let actionPath = "GetFeildworker?Email=\(txtEmail.text!)&Password=\(txtPassword.text!)"
                let result = fyp.getMethodCall(controllerName: "Feildworker", actionName: actionPath)
                do{
                    if result.ResponseCode == 200 {
                        if let returnData = String(data: result.ResponseData!, encoding: .utf8) {
                            print(returnData)
                            let decoder = JSONDecoder()
                            let response = try! decoder.decode(Feildworker.self, from: result.ResponseData!)
                            print ("Login Successfully")
                            print (response)
                            let controller=storyboard?.instantiateViewController (withIdentifier: "FeildWorker")
                            self.present(controller!, animated: true, completion: nil)
                        }
                      
                    }
                    else
                    {
                        let alert = UIAlertController(title: "Account", message: "Account doestn't exist.", preferredStyle: UIAlertController.Style.alert)

                                // add an action (button)
                                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                                // show the alert
                                self.present(alert, animated: true, completion: nil)
                     // print("Account doestn't exist")
                    }
                }
        }
          else if (Selected.text == "Donor"){
            let actionPath = "GetDonor?Email=\(txtEmail.text!)&Password=\(txtPassword.text!)"
                let result = fyp.getMethodCall(controllerName: "Donor", actionName: actionPath)
                do{
                    if result.ResponseCode == 200 {
                        if let returnData = String(data: result.ResponseData!, encoding: .utf8) {
                            print(returnData)
                            let decoder = JSONDecoder()
                            let response = try! decoder.decode(Donor.self, from: result.ResponseData!)
                            print ("Login Successfully")
                            print (response)
                            let controller=storyboard?.instantiateViewController (withIdentifier: "DonorDashBoard")
                            self.present(controller!, animated: true, completion: nil)
                        }
                      
                    }
                    else
                    {
                        let alert = UIAlertController(title: "Account", message: "Account doestn't exist.", preferredStyle: UIAlertController.Style.alert)

                                // add an action (button)
                                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                                // show the alert
                                self.present(alert, animated: true, completion: nil)
                      //print("Account doestn't exist")
                    }
                  
                }
            
        }
          
          else if (Selected.text == "Representor"){
            let actionPath = "GetRepresentator?Email=\(txtEmail.text!)&Password=\(txtPassword.text!)"
                let result = fyp.getMethodCall(controllerName: "Representator", actionName: actionPath)
                do{
                    if result.ResponseCode == 200 {
                        if let returnData = String(data: result.ResponseData!, encoding: .utf8) {
                            print(returnData)
                            let decoder = JSONDecoder()
                            let response = try! decoder.decode(Representator.self, from: result.ResponseData!)
                            print ("Login Successfully")
                            print (response)
                            let controller=storyboard?.instantiateViewController (withIdentifier: "Representator")
                            self.present(controller!, animated: true, completion: nil)
                        }
                      
                    }
                    else
                    {
                        let alert = UIAlertController(title: "Account", message: "Account doestn't exist.", preferredStyle: UIAlertController.Style.alert)

                                // add an action (button)
                                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                                // show the alert
                                self.present(alert, animated: true, completion: nil)
                      //print("Account doestn't exist")
                    }
            }
           
        }
        
    }
    
    
    @IBAction func email_Valid(_ sender: Any) {
        let text = txtEmail.text ?? ""
        if text.ValidEmail() {
            txtEmail.textColor = UIColor.black
        } else {
            let alert = UIAlertController(title: "Email", message: "Email is not Valid.", preferredStyle: UIAlertController.Style.alert)

                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                    // show the alert
                    self.present(alert, animated: true, completion: nil)
            //txtEmail.textColor = UIColor.red
            //lblEmailMeassage.text = "not valid email"
            //lblEmailMeassage.textColor = UIColor.red
        }
    }
    
    
    @IBAction func password_Valid(_ sender: Any) {
        let text = txtPassword.text ?? ""
        if text.ValidPassword() {
            txtPassword.textColor = UIColor.black
        } else {
            let alert = UIAlertController(title: "Password", message: "Password is Not Valid.", preferredStyle: UIAlertController.Style.alert)

                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                    // show the alert
                    self.present(alert, animated: true, completion: nil)
        }
    }
}

  extension String {
     
      func ValidEmail() -> Bool {
          let inputRegEx = "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[A-Za-z]{2,64}"
          let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
          return inputpred.evaluate(with:self)
      }
    
      func ValidPassword() -> Bool {
          let inputRegEx = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()-_+={}?>.<,:;~`']{8,}$"
          let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
          return inputpred.evaluate(with:self)
      }
      

}
