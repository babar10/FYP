//
//  SignUpButton.swift
//  Sadqa And Zakat Final
//
//  Created by Apple on 23/03/2022.
//

import UIKit

class SignUpButton: UIButton {

    override  func awakeFromNib() {
            super.awakeFromNib()
            layer.backgroundColor = UIColor(red: 111/255, green: 160/255, blue: 250/255, alpha: 1).cgColor
            layer.cornerRadius = 25
        }

}
