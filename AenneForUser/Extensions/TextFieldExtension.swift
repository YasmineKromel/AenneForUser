//
//  TextFieldExtension.swift
//  AenneForUser
//
//  Created by Mac on 1/23/20.
//  Copyright © 2020 Swira. All rights reserved.
//

import Foundation
import UIKit

extension UITextField
{
    func CreateRoundedCorner(_ textField :UITextField)
    {
        //let textField = UITextField()
        textField.backgroundColor = .clear
        textField.layer.cornerRadius = textField.frame.height / 2
        textField.layer.borderWidth = 1
    }
    
    func setIconLeft(_ image: UIImage) {
          let iconView = UIImageView(frame:
                         CGRect(x: 10, y: 5, width: 20, height: 20))
          iconView.image = image
          let iconContainerView: UIView = UIView(frame:
                         CGRect(x: 20, y: 0, width: 30, height: 30))
          iconContainerView.addSubview(iconView)
          leftView = iconContainerView
          leftViewMode = .always
       }
       
       func setIconRight(_ image: UIImage) {
          let iconView = UIImageView(frame:
                         CGRect(x: 10, y: 5, width: 20, height: 20))
          iconView.image = image
          let iconContainerView: UIView = UIView(frame:
                         CGRect(x: 20, y: 0, width: 30, height: 30))
          iconContainerView.addSubview(iconView)
          rightView = iconContainerView
          rightViewMode = .always
       }
}
