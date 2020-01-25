//
//  ViewExtension.swift
//  AenneForUser
//
//  Created by Mac on 1/25/20.
//  Copyright © 2020 Swira. All rights reserved.
//

import Foundation
import UIKit
extension UIView{
    
    func createRoundedView (_ view:UIView)
    {
        view.layer.cornerRadius = 8
    }
    
   func changeBackgroundColor(_ view:UIView)
   {
      view.backgroundColor = .white
    }
}
