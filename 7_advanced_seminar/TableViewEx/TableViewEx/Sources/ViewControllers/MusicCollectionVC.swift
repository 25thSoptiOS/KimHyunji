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
    
    var musicList: [Music] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMusicData()
        
        MusicCollectionView.reloadData()
        
        MusicCollectionView.delegate = self
        MusicCollectionView.dataSource = self
    }
    
}

extension MusicCollectionVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dvc = storyboard?.instantiateViewController(withIdentifier: "MusicDetailVC") as! MusicDetailVC
        
        let music = musicList[indexPath.row]
        
        dvc.albumImg = music.albumImg!
        dvc.musicTitle = music.musicTitle
        dvc.singer = music.singer
        
        navigationController?.pushViewController(dvc, animated: true)
    }
}

extension MusicCollectionVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musicList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = MusicCollectionView.dequeueReusableCell(withReuseIdentifier: "MusicCollectionCell", for: indexPath) as! MusicCollectionCell
        
        let music = musicList[indexPath.row]
        
        cell.albumImg.image = music.albumImg
        cell.musicTitle.text = music.musicTitle
        cell.singer.text = music.singer
        
        return cell
    }
}

extension MusicCollectionVC {
    func setMusicData() {
        let music1 = Music(title: "삐삐", singer: "아이유", coverName: "album_iu")
        let music2 = Music(title: "가을 타나봐", singer: "바이브", coverName: "album_vibe")
        let music3 = Music(title: "고백", singer: "양다일", coverName: "album_yangdail")
        let music4 = Music(title: "하루도 그대를 사랑하지 않은 적이 없었다", singer: "임창정", coverName: "album_im")
        let music5 = Music(title: "Save (Feat. 팔로알토)", singer: "루피(Loopy)", coverName: "album_smtm7")
        let music6 = Music(title: "멋지게 인사하는 법 (Feat. 슬기)", singer: "Zion.T", coverName: "album_ziont")
        let music7 = Music(title: "IDOL", singer: "방탄소년단", coverName: "album_bts")
        let music8 = Music(title: "시간이 들겠지 (Feat. Colde)", singer: "로꼬", coverName: "album_loco")
        let music9 = Music(title: "모든 날, 모든 순간", singer: "폴킴", coverName: "album_paul")
        let music10 = Music(title: "Way Back Home", singer: "숀(SHAUN)", coverName: "album_shaun")
        
        // 생성한 musicList 배열에 Music 모델들을 저장합니다.
        musicList = [music1, music2, music3, music4, music5, music6, music7, music8, music9, music10]
    }
}
