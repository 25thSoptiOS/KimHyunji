//
//  ViewController.swift
//  instagramSopt
//
//  Created by 김현지 on 30/09/2019.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 이미지 담을 변수
    var img: UIImage?
    var soptImg: UIImage?
    var afterBtn: UIImage?
    var beforeBtn: UIImage?
    // 좋아요 스위칭 변수
    var check = true
    
    // 인스타그램 이미지 뷰
    @IBOutlet var imgView: UIImageView!
    // 버튼 동작을 위한 IBOutlet
    @IBOutlet var likeBtn: UIButton!
    // 프로필 이미지 뷰
    @IBOutlet var imgSopt: UIImageView!
    // 버튼 클릭시 나타날 레이블
    @IBOutlet var text: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 프로필 이미지 둥글게 만들기
        imgSopt.layer.cornerRadius = 50/2
        
        // 변수에 이미지 할당
        img = UIImage(named: "instagram.jpg")
        soptImg = UIImage(named: "sopt.jpg")
        afterBtn = UIImage(named: "like.png")
        beforeBtn = UIImage(named: "bin.png")
        
        // 이미지 뷰에 이미지 적용
        imgView.image = img
        imgSopt.image = soptImg
        
        
    }

    @IBAction func onClick(_ sender: Any) {
        if(check){
            self.text.text = "h._.jiee 님이 좋아합니다."
            self.likeBtn.setImage(afterBtn, for: .normal)
            check = false
        }else {
            self.text.text = ""
            self.likeBtn.setImage(beforeBtn, for: .normal)
            check = true
        }
    }
    
    
}

