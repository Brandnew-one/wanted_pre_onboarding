//
//  Double + Extension.swift
//  OpenWeather
//
//  Created by Bran on 2022/06/14.
//

import Foundation

extension Double {
  func kelvinToCelsius() -> Double {
    return self - 273.15 // MARK: - 소수점 자리때문에 Label 깨질 수도 있는거 고려하고 있기
  }
}
