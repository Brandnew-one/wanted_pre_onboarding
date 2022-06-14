//
//  DetailWeatherViewController.swift
//  OpenWeather
//
//  Created by Bran on 2022/06/14.
//

import UIKit

class DetailWeatherViewController: UIViewController, ViewRepresentable {
  let detailWeatherView = DetailWeatherView()
  let detailWeatherViewModel = DetailWeatherViewModel()

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.isHidden = false
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupConstraints()
    setupTableView()
  }

  func setupView() {
    view.backgroundColor = .black
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

  private func setupTableView() {
    detailWeatherView.tableView.delegate = self
    detailWeatherView.tableView.dataSource = self
    detailWeatherView.tableView.register(DetailImageCell.self, forCellReuseIdentifier: DetailImageCell.identifier)
  }
  
}

extension DetailWeatherViewController: UITableViewDataSource, UITableViewDelegate {

  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.section == 0 {
      return 200
    } else {
      return 0
    }
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 {
      return 1
    } else {
      return 0
    }
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.section == 0 {
      guard
        let cell = detailWeatherView.tableView.dequeueReusableCell(
          withIdentifier: DetailImageCell.identifier,
          for: indexPath
        ) as? DetailImageCell,
        let weather = detailWeatherViewModel.weather
      else {
        return UITableViewCell()
      }
      cell.cellConfig(weather)
      return cell
    } else {
      return UITableViewCell()
    }
  }


}
