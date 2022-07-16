//
//  ViewController.swift
//  Study_CollectionView
//
//  Created by NAMU on 2022/07/16.
//

import UIKit

class ViewController: UIViewController {
    let emojies = ["1️⃣", "2️⃣", "3️⃣", "4️⃣", "5️⃣", "6️⃣", "7️⃣", "8️⃣", "9️⃣", "🔟"]
    var customLayout: CustomLayout?
    
    @IBOutlet weak var flowCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //flowCollectionView.delegate = self
        flowCollectionView.dataSource = self
        flowCollectionView.register(CollectionViewCell.self,
                                    forCellWithReuseIdentifier: CollectionViewCell.reuseIdentifier)
        flowCollectionView.collectionViewLayout = customLayout ?? CustomLayout()
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return emojies.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CollectionViewCell.reuseIdentifier,
            for: indexPath) as? CollectionViewCell else { return CollectionViewCell() }
        
        cell.myLabel.text = emojies[indexPath.row]
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let width = collectionView.frame.width / 4 - 10
        let size = (collectionView.frame.width - width * 4) / 3
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width / 4 - 10
        let size = CGSize(width: width, height: width * 1.2)
        return size
    }
}

// UICollectionViewFlowLayout 인스턴스 : layout 개체는 Collection View에서 콘텐츠의 시각적 배열을 정의하고, 우리는 FlowLayout을 사용해야 하기 때문에
// UICollectionViewDataSource 프로토콜 : 데이터를 관리하고 컬렉션 뷰에 대한 셀을 제공하기 위해서
// UICollectionViewDelegateFlowLayout 프로토콜 : 플로우 레이아웃을 사용해서 뷰를 구성하면서 셀사이의 간격과 셀의 크기정보를 주기 위해서
