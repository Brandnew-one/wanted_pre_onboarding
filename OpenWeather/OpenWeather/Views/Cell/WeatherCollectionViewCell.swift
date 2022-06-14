//
//  WeatherCollectionViewCell.swift
//  OpenWeather
//
//  Created by Bran on 2022/06/14.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell, ViewRepresentable, CellRepresentable {
  static let identifier = "WeatherCollectionViewCell"
  let imageView = UIImageView()
  let cityLabel = UILabel()
  let tempLabel = UILabel()
  let humidityLabel = UILabel()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
    setupConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("CollectionViewCell ERROR")
  }

  func setupView() {
    [imageView, cityLabel, tempLabel , humidityLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      self.addSubview($0)
    }
    self.backgroundColor = .white
    self.clipsToBounds = true
    self.layer.cornerRadius = 20

    cityLabel.font = .systemFont(ofSize: 20, weight: .heavy)
    tempLabel.font = .systemFont(ofSize: 15, weight: .bold)
    humidityLabel.font = .systemFont(ofSize: 15, weight: .bold)

    cityLabel.textColor = .black
    tempLabel.textColor = .black
    humidityLabel.textColor = .black
  }

  func setupConstraints() {
    NSLayoutConstraint.activate([
      cityLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
      cityLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
      cityLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8)
    ])

    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 8),
      imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
      imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
      imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
    ])

    NSLayoutConstraint.activate([
      humidityLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
      humidityLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
      humidityLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
    ])

    NSLayoutConstraint.activate([
      tempLabel.bottomAnchor.constraint(equalTo: humidityLabel.topAnchor, constant: -8),
      tempLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
      tempLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
    ])
  }

  private func setupWeatherBackground(_ item: List) {
    let whiteBackground = ["01d", "02d", "03d", "01n", "02n", "03n"]
    let darkGrayBackground = ["04d", "09d", "10d", "11d", "04n", "09n", "10n", "11n"]
    let lightGrayBackground = ["13d", "50n", "13d", "50n"]
    guard let icon = item.weather.first?.icon else { return }

    if whiteBackground.contains(icon) {
      self.backgroundColor = .white
    } else if darkGrayBackground.contains(icon) {
      self.backgroundColor = .systemGray
    } else {
      self.backgroundColor = .systemGray4
    }
  }

  func cellConfig(_ item: List) {
    setupWeatherBackground(item)
    if let imageURL = item.weather.first?.icon {
      imageView.getImageFromURL(imageURL)
    }
    cityLabel.text = item.name
    tempLabel.text = "🌡: \(Float(item.main.temp.kelvinToCelsius()))°C"
    humidityLabel.text = "🛁: \(item.main.humidity)%"
  }
}
