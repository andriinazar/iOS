//
//  UIImageView+Cache.swift
//  final_bank
//
//  Created by Andrii Nazar on 12/9/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()
extension UIImageView {
    func cacheImage(urlString: String){
        if let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) {
            let url = URL(string: encoded)
       
            image = nil
            if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
                self.image = imageFromCache
                return
            }
            if let imageUrl = url {
                URLSession.shared.dataTask(with: imageUrl) {
                    data, response, error in
                    if let result = data {
                        DispatchQueue.main.async {
                            if let imageToCache = UIImage(data: result) {
                                imageCache.setObject(imageToCache, forKey: urlString as AnyObject)
                                self.image = imageToCache
                            }
                        }
                    }
                    }.resume()
            }
        }
    }
}
