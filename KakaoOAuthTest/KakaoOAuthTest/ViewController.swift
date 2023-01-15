//
//  ViewController.swift
//  KakaoOAuthTest
//
//  Created by 이원빈 on 2023/01/09.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class ViewController: UIViewController {
    
    var name: String?
    var imageURL: URL?
    
    @IBOutlet weak var successLabel: UILabel!
    
    @IBOutlet weak var imageview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            // 카카오톡 로그인. api 호출 결과를 클로저로 전달.
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    // 예외 처리 (로그인 취소 등)
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    // do something
                    _ = oauthToken
                    // 어세스토큰
                    let accessToken = oauthToken?.accessToken
                    self.setUserInfo()
//                    print(accessToken)
                    //1-I7GAgDrZfdrck7nnuH0yJ6zdcuj_rMUFSKAIafCj10aAAAAYWaB2XE
                }
            }
        }
    }
    
    func setUserInfo() {
        UserApi.shared.me { user, error in
            if let error = error {
                print(error)
            } else {
                print("me() success")
            }
            print("사용자의 카카오 계정 : \(user?.kakaoAccount?.profile?.nickname)")
            self.successLabel.text = user?.kakaoAccount?.profile?.nickname
            let url = user?.kakaoAccount?.profile?.profileImageUrl
            self.getImage(url: url) { image in
                DispatchQueue.main.async {
                    self.imageview.image = image
                }
            }
        }
    }
    
    func getImage(url: URL?, _ completion: @escaping (UIImage) -> Void) {
        guard let url = url else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else { return }
            guard let data = data else { return }
            completion(UIImage(data: data)!)
        }
    }
}
