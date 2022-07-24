//
//  ViewController.swift
//  URLcachePractice
//
//  Created by Kiwon Song on 2022/07/22.
//

import UIKit

class ViewController: UIViewController {
let urlCacheView = URLCacheView()

    override func loadView() {
        view = urlCacheView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addTagetOfButtons()
    }

    func addTagetOfButtons() {
        urlCacheView.firstImageButton.addTarget(self, action: #selector(didFirstImageButtonTapped), for: .touchUpInside)
        urlCacheView.secondImageButton.addTarget(self, action: #selector(didSecondImageButtonTapped), for: .touchUpInside)
        urlCacheView.refreshImageButton.addTarget(self, action: #selector(didRefreshImageButtonTapped), for: .touchUpInside)
        urlCacheView.deleteCacheButton.addTarget(self, action: #selector(didDeleteCacheButtonTapped), for: .touchUpInside)
    }

    @objc func didFirstImageButtonTapped() {
        ImageURLSession.loadData(url: "https://wallpaperaccess.com/download/europe-4k-1369012") {[weak self] data in
            DispatchQueue.main.async {
                self?.urlCacheView.firstImageView.image = UIImage(data: data ?? Data())
            }
        }
    }
    
    @objc func didSecondImageButtonTapped() {
        ImageURLSession.loadData(url: "https://wallpaperaccess.com/download/europe-4k-1318341") {[weak self] data in
            DispatchQueue.main.async {
                self?.urlCacheView.secondImageView.image = UIImage(data: data ?? Data())
            }
        }
    }
    
    @objc func didRefreshImageButtonTapped() {
        urlCacheView.firstImageView.image = nil
        urlCacheView.secondImageView.image = nil
        print("이미지를 초기화 합니다.")
    }
    
    @objc func didDeleteCacheButtonTapped() {
        URLCache.shared.removeAllCachedResponses()
        print("모든 캐시 데이터를 삭제했습니다.")
    }
}

