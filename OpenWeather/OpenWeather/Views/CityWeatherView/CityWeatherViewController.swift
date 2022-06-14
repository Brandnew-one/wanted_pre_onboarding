//
//  CityWeatherViewController.swift
//  OpenWeather
//
//  Created by Bran on 2022/06/13.
//

import UIKit

class CityWeatherViewController: UIViewController, ViewRepresentable {
  let cityWeatherView = CityWeatherView()
  let cityWeatherViewModel = CityWeatherViewModel()

  override var preferredStatusBarStyle: UIStatusBarStyle { // TODO: -
    return .lightContent
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.isHidden = true
    cityWeatherViewModel.fetchWeathers {
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupNaviView()
    setupView()
    setupCollectionView()
    setupConstraints()

    cityWeatherViewModel.fetchWeathers {
      DispatchQueue.main.async {
        self.cityWeatherView.collectionView.reloadData()
      }
    }
  }

  // TODO: -
  override func viewDidAppear(_ animated: Bool) {
    navigationController?.navigationBar.barStyle = .black
  }

  private func setupNaviView() {
    navigationController?.navigationBar.isHidden = true
  }

  func setupView() {
    view.backgroundColor = .black
    cityWeatherView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(cityWeatherView)
  }

  private func setupCollectionView() {
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
    guard let weathers = cityWeatherViewModel.weathers else { return 0 }
    return weathers.cnt
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let vc = DetailWeatherViewController()
    navigationController?.pushViewController(vc, animated: true)
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard
      let cell = cityWeatherView.collectionView.dequeueReusableCell(
      withReuseIdentifier: WeatherCollectionViewCell.identifier, for: indexPath
    ) as? WeatherCollectionViewCell,
      let item = cityWeatherViewModel.weathers?.list[indexPath.item]
    else {
      return UICollectionViewCell()
    }
    cell.cellConfig(item)
    return cell
  }

}
