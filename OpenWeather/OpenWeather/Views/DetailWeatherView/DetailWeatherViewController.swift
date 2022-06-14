//
//  DetailWeatherViewController.swift
//  OpenWeather
//
//  Created by Bran on 2022/06/14.
//

import UIKit

class DetailWeatherViewController: UIViewController, ViewRepresentable {
  let detailWeatherView = DetailWeatherView()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupConstraints()
  }

  func setupView() {
    view.backgroundColor = .white
    detailWeatherView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(detailWeatherView)
  }

  func setupConstraints() {
    NSLayoutConstraint.activate([
      detailWeatherView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      detailWeatherView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      detailWeatherView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      detailWeatherView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}
