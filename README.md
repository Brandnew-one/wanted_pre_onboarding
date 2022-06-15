# wanted_pre_onboarding

## 🔥 앱 소개

#### Open Weather API 를 이용해 대한민국 도시들의 현재 날씨를 확인 할 수 있는 간단한 앱입니다.

#### 실행영상

![Simulator Screen Recording - iPhone 8 - 2022-06-15 at 12 21 44](https://user-images.githubusercontent.com/88618825/173730264-dc810542-7c08-4a24-a4d9-186957166df7.gif)

<br>

## 📅 개발기간

#### 2022.06.13 ~ 2022.06.15


## 🤦 회고

### 1) 라이브러리

온보딩 과제의 조건에 외부 라이브러리를 사용하지 않고 구현하는게 조건이였기 떄문에 뷰를 그릴 때 스토리보드와 코드 중 고민하다가 최근에 Snapkit 사용없이 뷰를 구성해본적이 없는것 같아
복습 차원에서 코드를 이용해 뷰를 구성했다.

또한 날씨 아이콘 이미지를 불러오는 과정에서 이미 한번 네트워크 통신을 통해 로딩된 이미지의 경우 NSCache를 이용해 캐시 메모리에 저장된 이미지를 사용할 수 있도록 설정했다.

### 2) UI

정해진 UI가 없다보니 사실 로직을 구현하는 것 보다 데이터를 어떻게 보여줄지를 더 고민했던 것 같다. 

| Main(1) | Detail(2) |
|:---:|:---:|
| ![Simulator Screen Shot - iPhone 8 - 2022-06-15 at 11 32 07](https://user-images.githubusercontent.com/88618825/173731998-a420a644-5a6f-4afa-95ed-b6dc3f615f10.png) | ![Simulator Screen Shot - iPhone 8 - 2022-06-15 at 12 03 32](https://user-images.githubusercontent.com/88618825/173732052-f96c78ca-2301-4998-b207-855dec814799.png) |

첫번쨰 화면에서는 20개 도시의 날씨 정보를 간략하게 확인 할 수 있어야 하기 때문에 CollectionView를 이용해 View를 구성했다.

처음 구현 했을 떄는 Cell의 backgroundColor를 전부 darkGray로 통일 시켰는데 화창한 날씨에도 너무 칙칙해 보이는(?) 느낌이 있어서 날씨별로 배경색이 다르게 올 수 있도록 설정했다.

네트워크 통신 결과 icon 값을 기준으로
* `01, 02 ,03` -> White (해가 뜨거나 옅은 구름)
* `04, 09, 10, 11` -> Dark Gray (비)
* `13, 50` -> Light Gray (눈, 안개)

그리고 첫번째 뷰의 경우 `navigation controller` 를 이용해서 구성했는데 navigation bar를 hidden 시키고 싶었는데 여기서 문제가 조금 발생했다.

라이트 모드인 경우에 상태바의 글씨(시간, wifi..)가 검은색이여서 safe area의 background에 가려져 보이지 않는 문제가 있었다.

```swift
 override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override func viewDidAppear(_ animated: Bool) {
    navigationController?.navigationBar.barStyle = .black
  }
```

위의 방법을 통해서 라이트 모드인 경우에도 상태바의 글씨색을 조정할 수 있었다.

두번째 뷰의 경우에는 하나의 테이블뷰로 구성되어 2개의 섹션으로 나누어서 구현했다. 사실 사용자에게 보여줘야 할 데이터가 많기 때문에 이를 어떻게 구상할지 고민하다가 `AccuWeather`의 디자인을
참고해서 만들었다.

두번째 뷰에서 보여줘야 하는 데이터들이 `List`라는 구조체 타입에 저장되어 있지만 Row 별로 어떤 데이터를 보여줘야 하는지 각 cell이 어떻게 판별할 수 있을지에 대한 고민이 많았다.

```swift
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

```
위와 같이 열거형을 통해서 indexPath의 row만 알면 원하는 값을 설정할 수 있도록 구성했다.

### 3) 네트워크 통신

20개 도시의 날씨를 가져와야 하는데 API 통신 중 group을 통해서 가져왔다. 여기서 각 도시의 City ID가 필요했는데 OpenWeather에서 제공하는 city.list.json 파일을 프로젝트에 넣고
필요한 도시 id를 도시명을 이용해 파싱하는 방식을 이용하려고 하다가 city.list.json 파일의 용량이 41.7MB 으로 너무 무거운것으 확인하고 필요한 도시들의 id를 모아서 plist 파일로 만들어서 사용했다.



