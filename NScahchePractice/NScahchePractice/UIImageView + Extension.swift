//
//  UIImageView + Extension.swift
//  NScahchePractice
//
//  Created by Kiwon Song on 2022/07/22.
//

import UIKit

let imageURLsession = ImageURLSession()

extension UIImageView {
    func setImageUrl(url: String) {

        let cachedKey = NSString(string: url)
        
        if let cachedImage = ImageCacheManager.shared.object(forKey: cachedKey) {
            self.image = cachedImage
            print("캐시된 데이터가 있습니다.")
            return
        }
        
        imageURLsession.loadData(url: url) { data in
            guard let data = data, let safeImage = UIImage(data: data)  else { return }
            ImageCacheManager.shared.setObject(safeImage, forKey: cachedKey)
            
            DispatchQueue.main.async {
                self.image = safeImage
                print("새로운 이미지를 받아왔습니다.")
            }
        }
    }
}
