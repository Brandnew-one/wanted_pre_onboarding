//
//  WeatherCollectionViewCell.swift
//  OpenWeather
//
//  Created by Bran on 2022/06/14.
//

import UIKit

// MARK: - Test Dummy View
class WeatherCollectionViewCell: UICollectionViewCell, ViewRepresentable, CellRepresentable {
  static let identifier = "WeatherCollectionViewCell"
  let imageView = UIImageView()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
    setupConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("CollectionViewCell ERROR")
  }

  func setupView() {
    imageView.translatesAutoresizingMaskIntoConstraints = false
    self.backgroundColor = .white
    self.addSubview(imageView)
    imageView.image = UIImage(systemName: "person")
  }

  func setupConstraints() {
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
      imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
      imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
      imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
    ])
  }

  func cellConfig() {
    print(#function)
  }
}
