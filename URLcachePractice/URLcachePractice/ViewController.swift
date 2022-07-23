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
        urlCacheView.firstImageView.image = 
    }
    
    @objc func didSecondImageButtonTapped() {
        
    }
    
    @objc func didRefreshImageButtonTapped() {
        
        print("이미지를 초기화 합니다.")
    }
    
    @objc func didDeleteCacheButtonTapped() {
        
        print("모든 캐시 데이터를 삭제했습니다.")
    }
}

