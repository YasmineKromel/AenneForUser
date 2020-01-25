//
//  ButtonExtension.swift
//  AenneForUser
//
//  Created by Mac on 1/23/20.
//  Copyright © 2020 Swira. All rights reserved.
//

import Foundation
import  UIKit

extension UIButton
{
    func CreateRoundedCorner(_ button :UIButton)
       {
           button.backgroundColor = .clear
           button.layer.cornerRadius = button.frame.height / 2
           button.layer.borderWidth = 1
       }
    
    func ScaleButtonFontSize(_ button :UIButton)
       {
           button.titleLabel?.numberOfLines = 1
           button.titleLabel?.adjustsFontSizeToFitWidth = true
           button.titleLabel?.lineBreakMode = .byClipping
           
       }
    
    func changeButtonBackground(_ button :UIButton)
    {
        button.backgroundColor = .white
    }
}
