//
//  CustomCollectionView.swift
//  AenneForUser
//
//  Created by Mac on 1/22/20.
//  Copyright © 2020 Swira. All rights reserved.
//

import UIKit


class CustomCollection: UIView {
    
    
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
           super.init(frame: frame)
           commonInit()
       }
       
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           commonInit()
       }
       
    
    private func commonInit() {
           let bundle = Bundle(for: type(of: self))
           bundle.loadNibNamed("CustomCollection", owner: self, options: nil)
           addSubview(contentView)
           contentView.frame = bounds
           contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
           contentView.backgroundColor = .yellow
           initCollectionView()
       }
    
    
    private func initCollectionView() {
      let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
      collectionView.register(nib, forCellWithReuseIdentifier: "CellCollection")
        collectionView.dataSource = self 
        // collectionView.delegate = self
    }
 }
extension CustomCollection: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 2
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellCollection", for: indexPath) as? CollectionViewCell else {
                fatalError("can't dequeue CollectionViewCell")
            }
            cell.cellLabel.text = "Hello From collection cell"
          //  cell.test()
            return cell
        }
    }

extension CustomCollection:UICollectionViewDelegate
{
    
}

