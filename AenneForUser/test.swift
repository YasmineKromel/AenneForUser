//
//  test.swift
//  AenneForUser
//
//  Created by Mac on 1/23/20.
//  Copyright © 2020 Swira. All rights reserved.
//

import Foundation
//extension RegisterationVController: UICollectionViewDelegate , UICollectionViewDataSource
//{
//
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return items.count ?? 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"Cell" , for: indexPath) as! GenderCell
//
//        cell.GenderImgView.image = UIImage(named: items[indexPath.item])
//
//        cell.CellGenderLbl.text = items[indexPath.item]
//        return cell
//    }
    

//

//    func GetLocations()
//    {
//         location = self.ImproveProfileBtn.frame
//
//    }
//
//    func setview()
//    {
//        if let location = self.location
//        {
//            self.ImproveProfileView.frame.origin.y = location.origin.y
//            self.ImproveProfileView.isHidden = false
//            ImproveProfileBtn.isHidden = true
//
//
//
//        //    self.ImproveProfileView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor) .isActive = true
//         //   self.ImproveProfileView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor) .isActive = true
//        //    self.ImproveProfileView.topAnchor.constraint(equalTo: self.BasicInfoView.topAnchor, constant: 15)
//
//
//       //     self.EmailTF.leadingAnchor.constraint(equalTo: self.ImproveProfileView.leadingAnchor, constant: 20)
//       //     self.EmailTF.trailingAnchor.constraint(equalTo: self.ImproveProfileView.trailingAnchor, constant: 20)
//          //  self.EmailTF.topAnchor.constraint(equalTo: self.ImproveProfileView.topAnchor, constant: 20)
//             self.EmailTF.heightAnchor.constraint(equalToConstant: 54)
//
//            self.BottomView.frame.origin.y = self.ImproveProfileView.frame.origin.y + self.ImproveProfileView.frame.height + 20
//
//        }
//    }
//

//
//    @IBAction func GenderClicked(_ sender: UIButton) {
//
//        if GenderCoView.isHidden == true
//        {
//            GenderCoView.isHidden = false
//        }
//        else
//        {
//            GenderCoView.isHidden = true
//
//        }
//    }
//
//    @IBAction func ImproveBtnClicked(_ sender: UIButton) {
//
////        if ImproveProfileView.isHidden == true
////        {
////            ImproveProfileView.isHidden = false
////        }else{
////            ImproveProfileView.isHidden = true
////        }
//
//     //   setview()
//
//
//    }
    

//


//   override func viewDidLoad() {
//        super.viewDidLoad()
//
////        self.title = "Registration"
////
////
////       // collection.dataSource = self
////       // collection.delegate = self
////
////
////
////        Scroll.contentSize = CGSize.init(width: 400, height: 2300)
////        Scroll.isScrollEnabled = true
////
////         GenderCoView.isHidden = true
//        // Do any additional setup after loading the view.
//    }


//


//
//    @IBOutlet weak var GenderCoView: UIView!
//       {
//           didSet
//           {
//               GenderCoView.layer.cornerRadius = 8
//
//           }
//       }
//
//       @IBOutlet weak var GenderBtn: UIButton!
//       {
//           didSet{
//               GenderBtn.layer.cornerRadius = GenderBtn.frame.height / 2
//               GenderBtn.layer.borderWidth = 1
//               GenderBtn.layer.borderColor = (UIColor( red: 0, green: 0, blue:0, alpha:1 )).cgColor
//
//               GenderBtn.backgroundColor = .white
//           }
//       }
//
//    @IBOutlet weak var collection: UICollectionView!
//
//
//
//
//    var items = ["Man","Woman"]
//
//    var location : CGRect?

//

//    func UserSigninWithAlamofire (_ num:String,_ pass:String)
//    {
//        guard let url = URL(string:"http://aenee.app.192-185-7-211.hgws27.hgwin.temp.domains/api/ClientLogin/Login") else {return}
//        let parameters = ["mobile":num,"password":pass]
//
//        Alamofire.request(url, method:.post,parameters:parameters,encoding: URLEncoding.queryString,headers: ["Content-Type": "application/json"]).responseJSON { response in
//
//            guard let data = response.data else {print("No response");return}
//
//             if let json = try? JSONDecoder().decode(SignInResponse.self, from:data)
//             {
//                print (json)
//                 self.AlretPopUp (title:"Success" , message:"Sucessful login")
//            }
//            else{
//
//                 self.AlretPopUp (title:"Failed" , message:"Fail to login")
//
//            }
////            switch response.result
////            {
////            case .success(let json ):
////                print (json)
////                self.AlretPopUp (title:"Success" , message:"Sucessful login")
////            case .failure(let error):
////                print(error)
////                self.AlretPopUp (title:"Failed" , message:error as! String)
////            }
//        }
//
//    }
