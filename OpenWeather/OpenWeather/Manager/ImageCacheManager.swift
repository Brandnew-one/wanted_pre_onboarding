//
//  ImageCacheManager.swift
//  OpenWeather
//
//  Created by Bran on 2022/06/14.
//

import UIKit

// http://openweathermap.org/img/wn/10d@2x.png (icon)

enum ImageNetworkError: Error {
  case `default`
}

class ImageCacheManager {
  static let shared = NSCache<NSString, UIImage>()
  private init() { }

  static func getImage(
    _ url: String,
    completion: @escaping (Result<UIImage, ImageNetworkError>) -> Void
  ) {
    if url.isEmpty { completion(.failure(.default)) }
    let cachedKey = NSString(string: url)

    if let cachedImage = ImageCacheManager.shared.object(forKey: cachedKey) {
      completion(.success(cachedImage))
    }

    guard let url = URL(string: url) else {
      completion(.failure(.default))
      return
    }
    URLSession.shared.dataTask(with: url) { data, response, error in
      DispatchQueue.main.async {
        if let _ = error {
          completion(.failure(.default))
        }
        if let data = data, let image = UIImage(data: data) {
          ImageCacheManager.shared.setObject(image, forKey: cachedKey)
          completion(.success(image))
        }
      }
    }
    .resume()
  }
}

extension UIImageView {
  func getImageFromURL(_ url: String) {
    ImageCacheManager.getImage(url) { result in
      switch result {
      case .failure(.default):
        self.image = UIImage()
      case .success(let image):
        self.image = image
      }
    }
  }
}