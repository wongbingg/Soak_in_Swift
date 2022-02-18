//
//  ViewController.swift
//  CollectionViewT
//
//  Created by 이원빈 on 2022/02/16.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    
    //현재페이지 체크 변수 (자동스크롤 시 필요)
    var nowPage: Int = 0
    
    //데이터 배열
    let dataArray:Array<UIImage> = [UIImage(named: "1.png")!,UIImage(named: "2.png")!,UIImage(named: "3.png")!]
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            bannerTimer()
        }
    
    //컬렉션뷰 개수 설정 (필수)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    
    //컬렉션뷰 셀 설정 (필수)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as? BannerCell else {
              return UICollectionViewCell()
            }
        cell.imgView.image = dataArray[indexPath.row]
        return cell
    }
    
    // UICollectionViewDelegateFlowLayout 상속
    // 컬렉션뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bannerCollectionView.frame.size.width, height: bannerCollectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
    //2초마다 실행되는 타이머
    func bannerTimer() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (Timer) in
            self.bannerMove()
        }
    }
    
    //배너 움직이는 메서드
    
    func bannerMove() {
        //현재페이지가 마지막 페이지일 경우
        if nowPage == dataArray.count-1 {
        //맨 처음 페이지로 돌아감
            bannerCollectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
            nowPage = 0
            return
        }
        //다음 페이지로 전환
        nowPage += 1
        bannerCollectionView.scrollToItem(at: NSIndexPath(item: nowPage, section: 0) as IndexPath, at: .right , animated: true)
    }

    


}

