//
//  Weathers.swift
//  OpenWeather
//
//  Created by Bran on 2022/06/14.
//

import Foundation

// MARK: - Weathers
struct Weathers: Codable {
  let cnt: Int
  let list: [List]
}

// MARK: - List
struct List: Codable {
  let coord: Coord
  let sys: Sys
  let weather: [Weather]
  let main: MainClass
  let visibility: Int
  let wind: Wind
  let clouds: Clouds
  let dt, id: Int
  let name: String
}

// MARK: - Clouds
struct Clouds: Codable {
  let all: Int
}

// MARK: - Coord
struct Coord: Codable {
  let lon, lat: Double
}

// MARK: - MainClass
struct MainClass: Codable {
  let temp, feelsLike, tempMin, tempMax: Double
  let pressure: Int
  let seaLevel, grndLevel: Int?
  let humidity: Int

  enum CodingKeys: String, CodingKey {
    case temp
    case feelsLike = "feels_like"
    case tempMin = "temp_min"
    case tempMax = "temp_max"
    case pressure
    case seaLevel = "sea_level"
    case grndLevel = "grnd_level"
    case humidity
  }
}

// MARK: - Sys
struct Sys: Codable {
  let country: String
  let timezone, sunrise, sunset: Int
}

// MARK: - Weather
struct Weather: Codable {
  let id: Int
  let main: String
  let weatherDescription: String
  let icon: String

  enum CodingKeys: String, CodingKey {
    case id, main
    case weatherDescription = "description"
    case icon
  }
}

// MARK: - Wind
struct Wind: Codable {
  let speed: Double
  let deg: Int
}
