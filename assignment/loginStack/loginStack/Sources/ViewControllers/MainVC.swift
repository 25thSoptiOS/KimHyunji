//
//  MainVC.swift
//  loginStack
//
//  Created by 김현지 on 2019/10/26.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit
import CHIPageControl

class MainVC: UIViewController {

    @IBOutlet var bannerCV: UICollectionView!
    @IBOutlet var paging: CHIPageControlAleppo!
    @IBOutlet var workCV: UICollectionView!
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // data setting
        // 어떤 이미지인지 이름으로 호출해주는 함수
        setBanner()
        
        bannerCV.delegate = self
        bannerCV.dataSource = self
    }
    


}

// 주석은 하단 컬렉션 뷰에 관한 코드

extension MainVC: UICollectionViewDataSource {
    
    // 섹션의 개수 리턴
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.workCV {
            return appDelegate!.workList.count
        }
        return appDelegate!.bannerList.count
    }
    
    // 셀에 관한 내용 리턴
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            if collectionView == self.workCV {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorkCell", for: indexPath) as! WorkCell
    
                let work = appDelegate!.workList[indexPath.row]
    
                cell.workIdx = work.workIdx
                cell.workImg.image = work.workMainImg
    
                return cell
            }
            else {
                let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
                
        let banner = appDelegate!.bannerList[indexPath.row]
                bannerCell.banner?.image = banner.bannerImg
                
                // bannerCell.banner = bannerList.
                return bannerCell
            }
        }
}

extension MainVC{
    func setBanner() {
        
        let banner1 = Banner(bannerName: "mainImage")
        let banner2 = Banner(bannerName: "mainImage02")
        let banner3 = Banner(bannerName: "mainImage03")
        
        appDelegate!.bannerList = [banner1, banner2, banner3]
    }
}

// UICollectionViewDelegate 를 채택합니다.
extension MainVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let x = scrollView.contentOffset.x
        let w = scrollView.bounds.size.width
        let currentPage = Int(ceil(x/w))
        print(currentPage)
        self.paging.set(progress: currentPage, animated: true)
    }
}
