//
//  CustomTextField.swift
//  Sadqa And Zakat Final
//
//  Created by Apple on 23/03/2022.
//

import UIKit

class CustomTextField: UITextField {
    override  func awakeFromNib() {
        super.awakeFromNib()
        layer.backgroundColor = UIColor(red: 249/255, green: 250/255, blue: 250/255, alpha: 1).cgColor
        layer.cornerRadius = 20
    }
}
