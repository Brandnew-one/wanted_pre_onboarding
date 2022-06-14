//
//  list + Extension.swift
//  OpenWeather
//
//  Created by Bran on 2022/06/15.
//

import Foundation

//sensible temperature
enum CellType: Int {
  case sensibleTemp = 0
  case minimumTemp = 1
  case maximumTemp = 2
  case humidity = 3
  case pressure = 4
  case windSpeed = 5
}

extension CellType {
  var title: String {
    switch self {
    case .sensibleTemp:
      return "Sensible Temperature"
    case .minimumTemp:
      return "Minimum Temperature"
    case .maximumTemp:
      return "Maximum Temperature"
    case .humidity:
      return "Humidity"
    case .pressure:
      return "Pressure"
    case .windSpeed:
      return "Wind Speed"
    }
  }

  var unit: String {
    switch self {
    case .sensibleTemp:
      return "°C"
    case .minimumTemp:
      return "°C"
    case .maximumTemp:
      return "°C"
    case .humidity:
      return "%"
    case .pressure:
      return "hpa"
    case .windSpeed:
      return "m/s"
    }
  }
}

extension List {
  func getInformation(_ type: CellType) -> String {
    switch type {
    case .sensibleTemp:
      return "\(Float(self.main.feelsLike.kelvinToCelsius()))"
    case .minimumTemp:
      return "\(Float(self.main.tempMin.kelvinToCelsius()))"
    case .maximumTemp:
      return "\(Float(self.main.tempMax.kelvinToCelsius()))"
    case .humidity:
      return "\(self.main.humidity)"
    case .pressure:
      return "\(self.main.pressure)"
    case .windSpeed:
      return "\(Float(self.wind.speed))"
    }
  }
}
