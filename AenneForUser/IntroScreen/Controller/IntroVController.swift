//
//  ViewController.swift
//  AenneForUser
//
//  Created by Yassmen on 1/8/20.
//  Copyright © 2020 Swira. All rights reserved.
//

import UIKit

class IntroVController: UIViewController {
    
    
  
    @IBOutlet weak var StartedBtn: UIButton!
    
    @IBOutlet weak var BackgroundImgView: UIImageView!
    
    
    @IBOutlet weak var TextLbl: UILabel!
    
    @IBOutlet weak var LoadingImg: UIImageView!
    
    @IBOutlet weak var SecduleTripsLbl: UILabel!
    
    @IBOutlet weak var NewFeatureLbl: UILabel!
    
    
    @IBOutlet weak var StackMiddle: UIStackView!
    
    
    
    @IBAction func StartedBtnClicked(_ sender: UIButton) {
        // Safe Push VC
//        if let viewController = 
//            if let navigator = navigationController {
//                navigator.pushViewController(viewController, animated: true)
//            }
//        }
        
    }
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
              
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
   

}

