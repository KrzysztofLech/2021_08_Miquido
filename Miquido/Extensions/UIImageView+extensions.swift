//
//  UIImageView+extensions.swift
//  Miquido
//
//  Created by KL on 09/08/2021.
//

import UIKit

extension UIImageView {
    func downloadImage(withUrl url: URL) {
        let session = URLSession.shared
        let downloadTask = session.downloadTask(with: url) { [weak self] url, response, error in
            guard error == nil, let url = url, let data = try? Data(contentsOf: url), let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self?.image = image
            }
        }
        downloadTask.resume()
    }
}
