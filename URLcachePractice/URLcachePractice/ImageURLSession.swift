//
//  ImageURLSession.swift
//  URLcachePractice
//
//  Created by Kiwon Song on 2022/07/22.
//

import Foundation

class ImageURLSession {
    static func loadData(url: String, completion: @escaping (Data?) -> Void) {
        let url = URL(string: url)!
        let urlReqeust = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlReqeust) { data, response, error in
            guard error == nil else {
                print("error")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("responseError")
                return
            }
            
            guard let safeData = data else {
                return
            }
            
            if URLCache.shared.cachedResponse(for: urlReqeust) == nil {
                print("캐시에 데이터가 없습니다.")
                let cachedResponse = CachedURLResponse(response: httpResponse, data: safeData, userInfo: nil, storagePolicy: .allowedInMemoryOnly)
                URLCache.shared.storeCachedResponse(cachedResponse, for: urlReqeust)
            }
            
            completion(safeData)
        }
        
        if URLCache.shared.cachedResponse(for: urlReqeust) == nil {
            print("통신함")
            task.resume()
        } else {
            URLCache.shared.getCachedResponse(for: task) { response in
                print("캐시에서 가져옵니다.")
                completion(response?.data)
            }
        }
    }
}
