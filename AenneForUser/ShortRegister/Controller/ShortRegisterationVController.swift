//
//  RegisterationVController.swift
//  AenneForUser
//
//  Created by Yassmen on 1/12/20.
//  Copyright © 2020 Swira. All rights reserved.
//

import UIKit




class ShortRegisterationVController: UIViewController {
    
    
    
    var name = ""
    var number = ""
    var pass = ""
    
    @IBOutlet weak var profileIcon: UIImageView!
    
    @IBOutlet weak var nameTF: UITextField!
    {        didSet{
            nameTF.CreateRoundedCorner(nameTF)
            nameTF.setIconLeft(#imageLiteral(resourceName: "Name icon"))
        }
    }
    
    @IBOutlet weak var mobileTF: UITextField!
    {
        didSet{
            mobileTF.CreateRoundedCorner(mobileTF)
               mobileTF.setIconLeft(#imageLiteral(resourceName: "Mobile icon"))
       }
    }
    
    @IBOutlet weak var passwordTF: UITextField!
    {
        didSet{
            
             passwordTF.CreateRoundedCorner(passwordTF)
             passwordTF.setIconLeft(#imageLiteral(resourceName: "locked icon"))
        }
    }
    
    @IBOutlet weak var improveProfileBtn: UIButton!
    {
        didSet
        {
            improveProfileBtn.CreateRoundedCorner(improveProfileBtn)
        }
        
    }
    
    
    @IBOutlet weak var termsBtn: UIButton!
    {
        didSet{
            
            termsBtn.CreateRoundedCorner(termsBtn)
        }
    }
    
    
    @IBOutlet weak var haveAccountBtn: UIButton!
    {
        didSet{
            haveAccountBtn.CreateRoundedCorner(haveAccountBtn)
            
        }
        
    }
    
    
    @IBOutlet weak var signUpBtn: UIButton!
    {
        didSet{
            signUpBtn.CreateRoundedCorner(signUpBtn)
        }
    }
    
    
   

    @IBAction func improveProfileClicked(_ sender: UIButton) {
    }
    
    
    @IBAction func haveAccountClicked(_ sender: UIButton) {
    }
    
    
    @IBAction func signUPClicked(_ sender: UIButton) {
        
        guard let name = nameTF.text else { self.AlretPopUp(title: "Alarm", message: "Please Enter Your Name");return}
        guard let mobile = mobileTF.text else { self.AlretPopUp(title: "Alarm", message: "Please Enter Your Mobile");return}
        guard let Pass = passwordTF.text else { self.AlretPopUp(title: "Alarm", message: "Please Enter Your Password");return}
        APIsCall.CreateUserShort(name, mobile,Pass, self)
    }
    

   
    

//      
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    


    override func viewWillAppear(_ animated: Bool) {
        UINavigationBar.appearance().tintColor = UIColor.red
     
    }
    
    
//    @IBAction func NameFieldChanged(_ sender: UITextField) {
//
//        name = nameTF.text ?? ""
//    }
//
//
//    @IBAction func MobileFieldChanged(_ sender: UITextField) {
//
//        number = mobileTF.text ?? ""
//    }
//
//    @IBAction func PassFieldChanged(_ sender: UITextField) {
//
//       pass = passwordTF.text ?? ""
//    }
//
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! LongRegisterVController
        destinationVC.dataPassed.self.name = nameTF.text ?? ""
        destinationVC.dataPassed.mobile = mobileTF.text ?? ""
        destinationVC.dataPassed.pass = passwordTF.text ?? ""
    }
    


    
}
