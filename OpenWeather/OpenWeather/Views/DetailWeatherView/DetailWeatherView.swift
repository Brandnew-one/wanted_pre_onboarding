//
//  DetailWeatherView.swift
//  OpenWeather
//
//  Created by Bran on 2022/06/14.
//

import UIKit

class DetailWeatherView: UIView, ViewRepresentable {
  let tableView = UITableView()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
    setupConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("DetailWeatherView ERROR")
  }

  func setupView() {
    tableView.translatesAutoresizingMaskIntoConstraints = false
    self.backgroundColor = .black
    self.addSubview(tableView)
  }

  func setupConstraints() {
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: self.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ])
  }
}
