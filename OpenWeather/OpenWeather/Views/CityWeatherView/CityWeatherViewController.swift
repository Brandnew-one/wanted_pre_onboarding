//
//  CityWeatherViewController.swift
//  OpenWeather
//
//  Created by Bran on 2022/06/13.
//

import UIKit

class CityWeatherViewController: UIViewController, ViewRepresentable {
  let cityWeatherView = CityWeatherView()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupCollectionView()
    setupConstraints()
  }

  func setupView() {
    view.backgroundColor = .white
    cityWeatherView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(cityWeatherView)
  }

  func setupCollectionView() {
    cityWeatherView.collectionView.register(
      WeatherCollectionViewCell.self,
      forCellWithReuseIdentifier: WeatherCollectionViewCell.identifier
    )
    cityWeatherView.collectionView.delegate = self
    cityWeatherView.collectionView.dataSource = self
  }

  func setupConstraints() {
    NSLayoutConstraint.activate([
      cityWeatherView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      cityWeatherView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide
        .leadingAnchor),
      cityWeatherView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      cityWeatherView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}

extension CityWeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource {

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard
      let cell = cityWeatherView.collectionView.dequeueReusableCell(
      withReuseIdentifier: WeatherCollectionViewCell.identifier, for: indexPath
    ) as? WeatherCollectionViewCell
    else {
      return UICollectionViewCell()
    }
    return cell
  }

}
