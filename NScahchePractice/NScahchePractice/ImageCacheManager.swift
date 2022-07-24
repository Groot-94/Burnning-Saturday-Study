//
//  ImageCacheManager.swift
//  NScahchePractice
//
//  Created by Kiwon Song on 2022/07/22.
//

import UIKit

class ImageCacheManager {
    
    static let shared = NSCache<NSString, UIImage>()
    
    private init() {}
}
 
