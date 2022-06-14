//
//  CityWeatherViewModel.swift
//  OpenWeather
//
//  Created by Bran on 2022/06/14.
//

import Foundation

class CityWeatherViewModel {
  var weathers: Weathers?

  func fetchWeathers(
    completion: @escaping () -> Void
  ) {
    APIService.shared.requestWeather { result in
      if case let .success(weathers) = result {
        self.weathers = weathers
        completion()
      }
    }
  }
}
