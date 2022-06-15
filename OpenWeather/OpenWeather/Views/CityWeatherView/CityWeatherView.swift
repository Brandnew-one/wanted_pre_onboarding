//
//  CityWeatherView.swift
//  OpenWeather
//
//  Created by Bran on 2022/06/13.
//

import UIKit

class CityWeatherView: UIView, ViewRepresentable {
  var collectionView = UICollectionView(
    frame: .zero,
    collectionViewLayout: UICollectionViewLayout()
  )

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
    setupConstraints()
    setupFlowLayout()
  }

  required init?(coder: NSCoder) {
    fatalError("CityWeatherView ERROR")
  }

  func setupView() {
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(collectionView)
    collectionView.backgroundColor = .black
  }

  func setupFlowLayout() {
    let layout = UICollectionViewFlowLayout()
    let spacing: CGFloat = 8
    let width = UIScreen.main.bounds.width - spacing * 3
//    let height = UIScreen.main.bounds.height - spacing * 4

    layout.minimumInteritemSpacing = spacing
    layout.minimumLineSpacing = spacing
//    layout.itemSize = CGSize(width: width / 2, height: height / 3)
    layout.itemSize = CGSize(width: width / 2, height: width / 2)
    layout.sectionInset = UIEdgeInsets(
      top: spacing,
      left: spacing,
      bottom: spacing,
      right: spacing
    )
    layout.scrollDirection = .vertical
    collectionView.collectionViewLayout = layout
  }

  func setupConstraints() {
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: self.topAnchor),
      collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ])
  }
}
