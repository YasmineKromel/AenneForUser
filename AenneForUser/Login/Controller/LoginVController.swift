//
//  Login.swift
//  AenneForUser
//
//  Created by Yassmen on 1/9/20.
//  Copyright © 2020 Swira. All rights reserved.
//

import UIKit
import  Moya
import  Alamofire

class LoginVController: UIViewController {
    
    //MARK: - IBOutlet
    
    @IBOutlet weak var PageTitle: UILabel!
    @IBOutlet weak var ProfileIcon: UIImageView!
    @IBOutlet weak var MobileTF: UITextField!{
        didSet{
            MobileTF.tintColor = UIColor.lightGray
            MobileTF.setIconLeft(#imageLiteral(resourceName: "Phone Icon"))
            MobileTF.CreateRoundedCorner(MobileTF)
            
           // MobileTF.layer.borderColor = UIColor.init(red: 53, green: 175, blue: 106, alpha: 1) as! CGColor
        }
    }
    
    @IBOutlet weak var PasswordTF: UITextField!
    {
        didSet{
            PasswordTF.tintColor = UIColor.lightGray
            PasswordTF.setIconLeft(#imageLiteral(resourceName: "Lock"))
            PasswordTF.setIconRight(#imageLiteral(resourceName: "visiable "))
            PasswordTF.CreateRoundedCorner(PasswordTF)
          
          //  PasswordTF.layer.borderColor = UIColor.init(red: 53, green: 175, blue: 106, alpha: 1) as! CGColor
            
        }
    }
    
    @IBOutlet weak var ForgotBTN: UIButton!
        {
            didSet{
                ForgotBTN.ScaleButtonFontSize(ForgotBTN)
           }
    }
    
    @IBOutlet weak var NotRegisteredBTN: UIButton!
    {
            didSet{
                NotRegisteredBTN.ScaleButtonFontSize(NotRegisteredBTN)
           }
    }
    
    @IBOutlet weak var SignInBTN: UIButton!
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    //hide navigation bar
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           navigationController?.setNavigationBarHidden(true, animated: animated)
       }
    
    
   // show navigation bar
       override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           navigationController?.setNavigationBarHidden(false, animated: animated)
       }
    
    
    @IBAction func SignInClicked(_ sender: UIButton) {
        
        guard  let Num = MobileTF.text else {self.AlretPopUp(title: "Alarm", message: "Please Enter Your Mobile");return}
        guard  let Pass = PasswordTF.text else {self.AlretPopUp(title: "Alarm", message: "Please Enter Your Password");return}
     
        APIsCall.UserSignIn(Num, Pass, self)
    }
    
  
        
}
    
  
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//}






