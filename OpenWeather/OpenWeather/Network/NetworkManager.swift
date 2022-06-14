//
//  NetworkManager.swift
//  OpenWeather
//
//  Created by Bran on 2022/06/14.
//

import Foundation

enum NetworkError: Error {
  case `default`
}

class NetworkManager {
  static let shared = NetworkManager()

  private let baseURL = URL(string: "https://api.openweathermap.org/data/2.5/group")!
  private let cityKeys = [
    "공주", "광주", "구미", "군산", "대구",
    "대전", "목포", "부산", "서산", "서울",
    "속초", "수원", "순천", "울산", "익산",
    "전주", "제주", "천안", "청주", "춘천"
  ]
  private var cityID: [String] = []
  private var appID: String = ""

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
      guard let id = dictionary[key] as? String else { return } // MARK: - 출력해줄지 고민
      cityID.append(id)
    }
  }

  private func setupAppID() {
    guard
      let plist = Bundle.main.url(forResource: "CityID", withExtension: "plist"),
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
    // MARK: - func 로 뺴는거 고민해보기
    var id: String = ""
    for i in 0..<cityID.count {
      id += cityID[i]
      if i != cityID.count - 1 {
        id += ","
      }
    }
    var url = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)
    let config = URLSessionConfiguration.default
    let session = URLSession(configuration: config)
    let query: [URLQueryItem] = [
      URLQueryItem(name: "id", value: id),
      URLQueryItem(name: "appid", value: appID),
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
          print(weatherData)
          completion(.success(weatherData))
        } else {
          completion(.failure(.default))
        }
      }
    }
    .resume()
  }
}
