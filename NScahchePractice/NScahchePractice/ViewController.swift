//
//  ViewController.swift
//  NScahchePractice
//
//  Created by Kiwon Song on 2022/07/22.
//

import UIKit

class ViewController: UIViewController {
    let nsCacheView = NSCacheView()
    
    override func loadView() {
        view = nsCacheView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addTagetOfButtons()
    }
    
    func addTagetOfButtons() {
        nsCacheView.firstImageButton.addTarget(self, action: #selector(didFirstImageButtonTapped), for: .touchUpInside)
        nsCacheView.secondImageButton.addTarget(self, action: #selector(didSecondImageButtonTapped), for: .touchUpInside)
        nsCacheView.refreshImageButton.addTarget(self, action: #selector(didRefreshImageButtonTapped), for: .touchUpInside)
        nsCacheView.deleteCacheButton.addTarget(self, action: #selector(didDeleteCacheButtonTapped), for: .touchUpInside)
    }
    
    @objc func didFirstImageButtonTapped() {
        nsCacheView.firstImageView.setImageUrl(url: "https://wallpaperaccess.com/download/europe-4k-1369012")
    }
    
    @objc func didSecondImageButtonTapped() {
        nsCacheView.secondImageView.setImageUrl(url: "https://wallpaperaccess.com/download/europe-4k-1318341")
    }
    
    @objc func didRefreshImageButtonTapped() {
        nsCacheView.firstImageView.image = nil
        nsCacheView.secondImageView.image = nil
        print("이미지를 초기화 합니다.")
    }
    
    @objc func didDeleteCacheButtonTapped() {
        ImageCacheManager.shared.removeAllObjects()
        print("모든 캐시 데이터를 삭제했습니다.")
    }
}

