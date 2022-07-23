//
//  UIImageView + Extension.swift
//  URLcachePractice
//
//  Created by Kiwon Song on 2022/07/22.
//

import UIKit

extension UIImageView {
    func loadImage(from urlString: String, placeholder: UIImage? = nil) {
        setImage(placeholder)
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        
        APIService().get(url: url) { [weak self] (data, error) in
            guard let _imageUrl = self?.imageUrl, _imageUrl == url else {
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                return
            }
            
            self?.setImage(image)
        }
    }
    
    private func setImage(_ image: UIImage?) {
        DispatchQueue.main.async { [weak self] in
            self?.image = image
        }
    }
    
}
