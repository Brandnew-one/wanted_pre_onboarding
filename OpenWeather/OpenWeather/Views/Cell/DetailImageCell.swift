//
//  DetailImageCell.swift
//  OpenWeather
//
//  Created by Bran on 2022/06/14.
//

import UIKit

class DetailImageCell: UITableViewCell, ViewRepresentable, CellRepresentable {
  static let identifier = "DetailImageCell"
  let stackView = UIStackView()
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
    [stackView, descriptionLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.backgroundColor = .black
      self.addSubview($0)
    }
    self.backgroundColor = .black
    tempLabel.textColor = .white
    descriptionLabel.textColor = .white

    tempLabel.font = .systemFont(ofSize: 50, weight: .heavy)
    descriptionLabel.font = .systemFont(ofSize: 18, weight: .bold)

    stackView.spacing = 8
    stackView.distribution = .fillEqually

    [tableImageView, tempLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.backgroundColor = .black
      stackView.addArrangedSubview($0)
    }
  }

  func setupConstraints() {
    NSLayoutConstraint.activate([
      stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 18)
    ])

    NSLayoutConstraint.activate([
      tableImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.25),
      tableImageView.heightAnchor.constraint(equalTo: tableImageView.widthAnchor)
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
