//
//  DetailInformationCell.swift
//  OpenWeather
//
//  Created by Bran on 2022/06/15.
//

import UIKit

class DetailInformationCell: UITableViewCell, ViewRepresentable, CellRepresentable {
  static let identifier = "DetailInformationCell"
  let titleLabel = UILabel()
  let contentLabel = UILabel()
  var index: Int? = nil

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupView()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("DetailInformationCell ERROR")
  }

  func setupView() {
    [titleLabel, contentLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.backgroundColor = .black
      $0.textColor = .white
      self.addSubview($0)
      self.backgroundColor = .black
      titleLabel.font = .systemFont(ofSize: 12, weight: .heavy)
      contentLabel.font = .systemFont(ofSize: 14, weight: .heavy)
    }
  }

  func setupConstraints() {
    NSLayoutConstraint.activate([
      titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
      titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
      titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 8)
    ])

    NSLayoutConstraint.activate([
      contentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
      contentLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
      contentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 8)
    ])
  }

  // MARK: - index 설정 후 사용
  func cellConfig(_ item: List) {
    guard
      let index = index,
      let type = CellType(rawValue: index)
    else { return }
    titleLabel.text = type.title
    contentLabel.text = item.getInformation(type) + type.unit
  }
}
