//
//  ViewController.swift
//  Sadqa And Zakat Final
//
//  Created by Apple on 23/03/2022.
//

import UIKit

class ViewController: UIViewController ,UIPickerViewDelegate ,UIPickerViewDataSource {
    //@IBOutlet weak var pickerViewRole: UIPickerView!
    @IBOutlet weak var Selected: UITextField!
    @IBOutlet weak var txtEmail: CustomTextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtCnic: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    var am = AdminManager()
    //var users : [Users] = []
    
    let userRole = ["Donor","FieldWorker","Representor"]
    var selectedRole: String?
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return userRole.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent   component: Int) -> String? {
    return userRole[row]
      }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
     {
        selectedRole = userRole[row]
        return Selected.text = selectedRole
     }
    @IBAction func CreateAccount(_ sender: Any) {
        if(txtEmail.text == "" && txtPassword.text == "" && txtPhone.text == "" && txtCnic.text == "" && Selected.text == "")
        {
            let alert = UIAlertController(title: "Create Account", message: "Enter Your Detail .", preferredStyle: UIAlertController.Style.alert)

                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                    // show the alert
                    self.present(alert, animated: true, completion: nil)
        }

           if(Selected.text == "Donor"){
            let donor = Donor()
            donor.Email = txtEmail.text!
            donor.ContactNo = txtPhone.text!
            donor.Cnic = txtCnic.text!
            donor.Address = txtAddress.text!
            donor.Password = txtPassword.text!
            let dm = DonorManager()
            let create = dm.addDonor(donor: donor)
            if create == true {
            /// print("Account is Successfully Created")
                let alert = UIAlertController(title: "Account", message: "Account is Succesfully Created.", preferredStyle: UIAlertController.Style.alert)

                        // add an action (button)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                        // show the alert
                        self.present(alert, animated: true, completion: nil)
            }
        }
        else if(Selected.text == "FieldWorker"){
            let fieldworker = Feildworker()
            fieldworker.Email = txtEmail.text!
            fieldworker.ContactNo = txtPhone.text!
            fieldworker.Address = txtAddress.text!
            fieldworker.Cnic = txtCnic.text!
            fieldworker.Password = txtPassword.text!
            let fw = FeildworkerManager()
            let create = fw.addFeildworker(feildworker: fieldworker)
            if create == true {
              //print("Account is Successfully Created")
                let alert = UIAlertController(title: "Account", message: "Account is Succesfully Created.", preferredStyle: UIAlertController.Style.alert)

                        // add an action (button)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                        // show the alert
                        self.present(alert, animated: true, completion: nil)
            }
        }
        else if(Selected.text == "Representor"){
            let representor = Representator()
            representor.Email = txtEmail.text!
            representor.ContactNo = txtPhone.text!
            representor.Address = txtAddress.text!
            representor.Cnic = txtCnic.text!
            representor.Password = txtPassword.text!
            let repre = RepresentatorManager()
            let create = repre.addRepresentator(representator: representor)
            if create == true {
             // print("Account is Successfully Created")
                let alert = UIAlertController(title: "Account", message: "Account is Succesfully Created.", preferredStyle: UIAlertController.Style.alert)

                        // add an action (button)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                        // show the alert
                        self.present(alert, animated: true, completion: nil)
            }
        }
        else{
           //print(am.Message)
            let alert = UIAlertController(title: "Account", message: "Invalid Data.", preferredStyle: UIAlertController.Style.alert)

                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                    // show the alert
                    self.present(alert, animated: true, completion: nil)
        }
        
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        //users = um.GetUsers()
        //pickerView.delegate = self
        //pickerView.dataSource = self
        
    
    }
  
    @IBAction func Email_Valid(_ sender: Any) {
        let text = txtEmail.text ?? ""
        if text.isValidEmail() {
            txtEmail.textColor = UIColor.black
        } else {
            let alert = UIAlertController(title: "Email", message: "Email is not Valid.", preferredStyle: UIAlertController.Style.alert)

                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                    // show the alert
                    self.present(alert, animated: true, completion: nil)
            //txtEmail.textColor = UIColor.red
           // lblEmailMessage.text = "not valid email"
            //lblEmailMessage.textColor = UIColor.red
        }
    }
    /*@IBAction func name_act(_ sender: Any){
          let text = nameTextfield.text ?? ""
          if text.isValidName() {
              nameTextfield.textColor = UIColor.black
              nameMessage.text = ""
          } else {
              nameTextfield.textColor = UIColor.red
              nameMessage.text = "not valid name"
          }
      }*/

    @IBAction func Phone_Valid(_ sender: Any) {
        let text = txtPhone.text ?? ""
        if text.filterPhoneNumber().isValidPhone() {
            txtPhone.textColor = UIColor.black
        } else {
            let alert = UIAlertController(title: "Phone Number", message: "Phone Numer is Not Valid.", preferredStyle: UIAlertController.Style.alert)

                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                    // show the alert
                    self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func Cnic_Valid(_ sender: Any) {
        let text = txtCnic.text ?? ""
        if text.isValidCnic() {
            txtCnic.textColor = UIColor.black
        }
        else {
            let alert = UIAlertController(title: "CNIC", message: "Cnic is Not Valid.", preferredStyle: UIAlertController.Style.alert)

                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                    // show the alert
                    self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func Password_Valid(_ sender: Any) {
        let text = txtPassword.text ?? ""
        if text.isValidPassword() {
            txtPassword.textColor = UIColor.black
        } else {
            let alert = UIAlertController(title: "Password", message: "Enter Strong Password.", preferredStyle: UIAlertController.Style.alert)

                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                    // show the alert
                    self.present(alert, animated: true, completion: nil)
        }
    }
    
  }

  extension String {
      func isValidName() -> Bool {
          let inputRegEx = "^[a-zA-Z\\_]{2,25}$"
          let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
          return inputpred.evaluate(with:self)
      }
      func isValidEmail() -> Bool {
          let inputRegEx = "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[A-Za-z]{2,64}"
          let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
          return inputpred.evaluate(with:self)
      }
      func isValidPhone() -> Bool {
          let inputRegEx = "^((\\+)|(00))[0-9]{6,14}$"
          let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
          return inputpred.evaluate(with:self)
      }
      func isValidPassword() -> Bool {
          let inputRegEx = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()-_+={}?>.<,:;~`']{8,}$"
          let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
          return inputpred.evaluate(with:self)
      }
      
      public func filterPhoneNumber() -> String {
          return String(self.filter {!" ()._-\n\t\r".contains($0)})
      }
    func isValidCnic() -> Bool {
        let inputRegEx = "^[0-9]{5}-[0-9]{7}-[0-9]{1}$"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
    }

}

