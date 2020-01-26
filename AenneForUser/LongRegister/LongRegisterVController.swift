//
//  LongRegisterVController.swift
//  AenneForUser
//
//  Created by Mac on 1/23/20.
//  Copyright © 2020 Swira. All rights reserved.
//

import UIKit

class LongRegisterVController: UIViewController {
    
    
    
    @IBOutlet weak var collapsedViewHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var collectionview: UICollectionView!
    {
        didSet{
            collectionview.layer.cornerRadius = 8
        }
    }

    @IBOutlet weak var scroll: UIScrollView!
   
    @IBOutlet weak var profileIcon: UIImageView!
    
    @IBOutlet weak var nameTF: UITextField!
    {
        didSet{
            nameTF.CreateRoundedCorner(nameTF)
        }
    }
    
    @IBOutlet weak var mobileTF: UITextField!
    {
           didSet{
               mobileTF.CreateRoundedCorner(mobileTF)
           }
       }
    
    @IBOutlet weak var passTF: UITextField!
    {
         didSet{
                  passTF.CreateRoundedCorner(passTF)
         }
   }
       
    
    
    @IBOutlet weak var emailTF: UITextField!
    {
        didSet{
             emailTF.CreateRoundedCorner(emailTF)
         }
  }
    
    
    @IBOutlet weak var diabledBtn: UIButton!
    {
       didSet{
               diabledBtn.CreateRoundedCorner(diabledBtn)    
           }
   }
    
    @IBOutlet weak var emergencyPhoneTF: UITextField!
    {
        didSet{
            emergencyPhoneTF.CreateRoundedCorner(emergencyPhoneTF)
        }
    }
    
    @IBOutlet weak var disablityBtn: UIButton!
    {
        didSet{
            
            disablityBtn.CreateRoundedCorner(disablityBtn)
            disablityBtn.changeBackgroundColor(disablityBtn)
            
        }
    }
    
    @IBOutlet weak var DisablityContainerView: UIView!
    {
        didSet{
            DisablityContainerView.createRoundedView(DisablityContainerView)
            DisablityContainerView.changeBackgroundColor(DisablityContainerView)
            
        }
    }
    

    @IBOutlet weak var improveBtn: UIButton!
    {
           didSet{
               improveBtn.CreateRoundedCorner(improveBtn)
               
           }
       }
    
    @IBOutlet weak var cityBtn: UIButton!
    {
           didSet{
               cityBtn.CreateRoundedCorner(cityBtn)
               
           }
       }
    
    @IBOutlet weak var areaBtn: UIButton!
    {
           didSet{
               areaBtn.CreateRoundedCorner(areaBtn)
               
           }
       }
    
    @IBOutlet weak var genderBtn: UIButton!
    {
           didSet{
               genderBtn.CreateRoundedCorner(genderBtn)
               
           }
       }
    
    @IBOutlet weak var birthdayBtn: UIButton!
    {
           didSet{
               birthdayBtn.CreateRoundedCorner(birthdayBtn)
               
           }
       }
    
    @IBOutlet weak var termsBtn: UIButton!
    
    
    @IBOutlet weak var haveAccountBtn: UIButton!
    
    
    @IBOutlet weak var signUpBtn: UIButton!
    
    @IBOutlet weak var disabledContainer: UIView!
    {
        didSet{
            disabledContainer.createRoundedView(disabledContainer)
        }
    }
    
    
    @IBOutlet weak var disabledCollection: UICollectionView!
    
    
    @IBOutlet weak var cityContainer: UIView!
    {
           didSet{
               cityContainer.createRoundedView(cityContainer)
           }
       }
    
    
    @IBOutlet weak var cityCollection: UICollectionView!
    
    
    @IBOutlet weak var areaContainer: UIView!
    {
        didSet{
            areaContainer.createRoundedView(areaContainer)
        }
    }
   
    @IBOutlet weak var areaCollection: UICollectionView!
    
    
    @IBOutlet weak var genderContainer: UIView!
    {
          didSet{
              genderContainer.createRoundedView(genderContainer)
          }
      }
    
    @IBOutlet weak var genderCollection: UICollectionView!
    
    
    @IBOutlet weak var datePickerView: UIDatePicker!
    
    @IBOutlet weak var improveInfoStack: UIStackView!
    
    
    @IBOutlet weak var BottomStack: UIStackView!
    
    var dataPassed = PassedData(name:"",mobile:"",pass:"")
    
    var BottomStackYAxis = 0
    // /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameTF.text = dataPassed.name
        mobileTF.text = dataPassed.mobile
        passTF.text = dataPassed.pass
        
       // BottomStackYAxis = BottomStack.frame.origin.y
      //  collapsedViewHeight.constant = 0
        improveInfoStack.isHidden = true
        

        
        collectionview.dataSource = self
        collectionview.delegate = self
        
        //register cell
        let nibcell = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionview.register(nibcell, forCellWithReuseIdentifier: "CollectionViewCell")
        
        
        APIsCall.GetDisablities(self) {
              
            self.ResizeHeightOfCollectionView()
            self.collectionview.reloadData()
        }
        
        
        
    }
    
    @IBAction func improveBtnClicked(_ sender: UIButton) {
        UIView.animate(withDuration: 1) {
          //  self.collapsedViewHeight.constant = 1696
            self.improveInfoStack.isHidden = false
            
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
         navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
   override func viewDidAppear(_ animated: Bool) {
           scroll.delegate = self
            scroll.contentSize = CGSize.init(width: self.view.frame.width, height: self.view.frame.height*3)
             scroll.isScrollEnabled = true    }

    
    func ResizeHeightOfCollectionView()
    {
       if let flowLayout = collectionview.collectionViewLayout as? UICollectionViewFlowLayout {
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        flowLayout.itemSize = UICollectionViewFlowLayout.automaticSize
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

}

extension LongRegisterVController: UICollectionViewDelegate , UICollectionViewDataSource
   {
    
        func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        }
   
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return APIsCall.disablity_types.count
       }
    
      
   
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"CollectionViewCell" , for: indexPath) as!CollectionViewCell
   
        cell.cellLabel.text = APIsCall.disablity_types[indexPath.row].disability_Type_Name
        //cell.img.image = UIImage(named: APIsCall.disablity_type[indexPath.item])
   
          // cell.CellGenderLbl.text = items[indexPath.item]
           return cell
   }
}
