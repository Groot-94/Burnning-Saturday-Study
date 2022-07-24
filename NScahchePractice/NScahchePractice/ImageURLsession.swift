//
//  ImageURLsession.swift
//  NScahchePractice
//
//  Created by Kiwon Song on 2022/07/22.
//

import Foundation

class ImageURLSession {
    func loadData(url: String, completion: @escaping (Data?) -> Void) {
        let task = URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            
            guard error == nil else {
                print("error")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("responseError")
                return
            }
            
            DispatchQueue.global().async {
                guard let safeData = data else {
                    return
                }
                completion(safeData)
            }
        }
        task.resume()
    }
}
