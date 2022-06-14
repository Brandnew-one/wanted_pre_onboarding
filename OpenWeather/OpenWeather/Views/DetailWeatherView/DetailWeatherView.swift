//
//  DetailWeatherView.swift
//  OpenWeather
//
//  Created by Bran on 2022/06/14.
//

import UIKit

// MARK: - Test Dummy View
class DetailWeatherView: UIView, ViewRepresentable {
  let imageView = UIImageView()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
    setupConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("DetailWeatherView ERROR")
  }

  func setupView() {
    imageView.translatesAutoresizingMaskIntoConstraints = false
    self.backgroundColor = .white
    self.addSubview(imageView)
    imageView.image = UIImage(systemName: "person")
  }

  func setupConstraints() {
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: self.topAnchor),
      imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ])
  }
}
