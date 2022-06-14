//
//  APIService.swift
//  OpenWeather
//
//  Created by Bran on 2022/06/14.
//

import Foundation

enum NetworkError: Error {
  case `default`
}

class APIService {
  static let shared = APIService()

  private let baseURL = URL(string: "https://api.openweathermap.org/data/2.5/group")!
  private let cityKeys = [
    "공주", "광주", "구미", "군산", "대구",
    "대전", "목포", "부산", "서산", "서울",
    "속초", "수원", "순천", "울산", "익산",
    "전주", "제주", "천안", "청주", "춘천"
  ]
  private var cityID: [String] = []
  private var appID: String = ""
  private var id: String = ""

  private init() {
    setupCityID()
    setupAppID()
  }

  private func setupCityID() {
    guard
      let plist = Bundle.main.url(forResource: "CityID", withExtension: "plist"),
      let dictionary = NSDictionary(contentsOf: plist)
    else {
      print("invalid Plist")
      return
    }
    for key in cityKeys {
      if let id = dictionary[key] as? String {
        cityID.append(id)
      }
    }
    for i in 0..<cityID.count {
      self.id += cityID[i]
      if i != cityID.count - 1 {
        self.id += ","
      }
    }
  }

  private func setupAppID() {
    guard
      let plist = Bundle.main.url(forResource: "AppID", withExtension: "plist"),
      let dictionary = NSDictionary(contentsOf: plist),
      let id = dictionary["appid"] as? String
    else {
      print("invalid Plist")
      return
    }
    self.appID = id
  }

  func requestWeather(
    completion: @escaping (Result<Weathers, NetworkError>) -> Void
  ) {
    var url = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)
    let config = URLSessionConfiguration.default
    let session = URLSession(configuration: config)
    let query: [URLQueryItem] = [
      URLQueryItem(name: "id", value: self.id),
      URLQueryItem(name: "appid", value: self.appID),
    ]
    url?.queryItems = query

    guard let queryURL = url?.url else { return }
    let requestURL = URLRequest(url: queryURL)

    URLSession.shared.dataTask(with: requestURL) { data, response, error in
      DispatchQueue.main.async {
        guard
          let response = response as? HTTPURLResponse,
          let data = data
        else {
          completion(.failure(.default))
          return
        }
        if let weatherData = try? JSONDecoder().decode(Weathers.self, from: data) {
          completion(.success(weatherData))
        } else {
          completion(.failure(.default))
        }
      }
    }
    .resume()
  }
}
