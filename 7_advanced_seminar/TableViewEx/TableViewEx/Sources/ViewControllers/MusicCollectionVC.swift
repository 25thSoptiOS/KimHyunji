//
//  MusicCollectionVC.swift
//  TableViewEx
//
//  Created by 김현지 on 2019/12/11.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit

class MusicCollectionVC: UIViewController {
    
    @IBOutlet var MusicCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.MusicCollectionView.reloadData()
        
        self.MusicCollectionView.delegate = self
        self.MusicCollectionView.dataSource = self
    }
    
    
    extension MusicCollectionVC: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
        }
    }
    
    extension MusicCollectionVC: UICollectionViewDelegate {
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
        }
    }

    

}
