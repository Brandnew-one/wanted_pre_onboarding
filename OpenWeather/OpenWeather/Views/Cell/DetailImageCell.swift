//
//  DetailImageCell.swift
//  OpenWeather
//
//  Created by Bran on 2022/06/14.
//

import UIKit

class DetailImageCell: UITableViewCell, ViewRepresentable, CellRepresentable {
  static let identifier = "DetailImageCell"
  let tableImageView = UIImageView()
  let tempLabel = UILabel()
  let descriptionLabel = UILabel()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupView()
    setupConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("DetailImageCell ERROR")
  }

  func setupView() {
    [tableImageView, tempLabel, descriptionLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.backgroundColor = .black
      self.addSubview($0)
    }
    self.backgroundColor = .black
    tempLabel.textColor = .white
    descriptionLabel.textColor = .white

    tempLabel.font = .systemFont(ofSize: 50, weight: .heavy)
    descriptionLabel.font = .systemFont(ofSize: 18, weight: .bold)
  }

  func setupConstraints() {
    NSLayoutConstraint.activate([
      tableImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.25),
      tableImageView.heightAnchor.constraint(equalTo: tableImageView.widthAnchor),
      tableImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -25),
      tableImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 18)
    ])

    NSLayoutConstraint.activate([
      tempLabel.centerYAnchor.constraint(equalTo: tableImageView.centerYAnchor),
      tempLabel.leadingAnchor.constraint(equalTo: tableImageView.trailingAnchor, constant: 8),
      tempLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
    ])

    NSLayoutConstraint.activate([
      descriptionLabel.topAnchor.constraint(equalTo: tableImageView.bottomAnchor, constant: 18),
      descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
    ])
  }

  func cellConfig(_ item: List) {
    guard let weather = item.weather.first else { return }
    tableImageView.getImageFromURL(weather.icon)
    tempLabel.text = "\(Int(item.main.temp.kelvinToCelsius()))°"
    descriptionLabel.text = weather.weatherDescription
  }

}
