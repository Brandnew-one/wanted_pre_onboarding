# wanted_pre_onboarding

## ๐ฅ ์ฑ ์๊ฐ

#### Open Weather API ๋ฅผ ์ด์ฉํด ๋ํ๋ฏผ๊ตญ ๋์๋ค์ ํ์ฌ ๋ ์จ๋ฅผ ํ์ธ ํ  ์ ์๋ ๊ฐ๋จํ ์ฑ์๋๋ค.

#### ์คํ์์

![Simulator Screen Recording - iPhone 8 - 2022-06-15 at 12 21 44](https://user-images.githubusercontent.com/88618825/173730264-dc810542-7c08-4a24-a4d9-186957166df7.gif)

<br>

## ๐ ๊ฐ๋ฐ๊ธฐ๊ฐ

#### 2022.06.13 ~ 2022.06.15


## ๐คฆ ํ๊ณ 

### 1) ๋ผ์ด๋ธ๋ฌ๋ฆฌ

์จ๋ณด๋ฉ ๊ณผ์ ์ ์กฐ๊ฑด์ ์ธ๋ถ ๋ผ์ด๋ธ๋ฌ๋ฆฌ๋ฅผ ์ฌ์ฉํ์ง ์๊ณ  ๊ตฌํํ๋๊ฒ ์กฐ๊ฑด์ด์๊ธฐ ๋๋ฌธ์ ๋ทฐ๋ฅผ ๊ทธ๋ฆด ๋ ์คํ ๋ฆฌ๋ณด๋์ ์ฝ๋ ์ค ๊ณ ๋ฏผํ๋ค๊ฐ ์ต๊ทผ์ Snapkit ์ฌ์ฉ์์ด ๋ทฐ๋ฅผ ๊ตฌ์ฑํด๋ณธ์ ์ด ์๋๊ฒ ๊ฐ์
๋ณต์ต ์ฐจ์์์ ์ฝ๋๋ฅผ ์ด์ฉํด ๋ทฐ๋ฅผ ๊ตฌ์ฑํ๋ค.

๋ํ ๋ ์จ ์์ด์ฝ ์ด๋ฏธ์ง๋ฅผ ๋ถ๋ฌ์ค๋ ๊ณผ์ ์์ ์ด๋ฏธ ํ๋ฒ ๋คํธ์ํฌ ํต์ ์ ํตํด ๋ก๋ฉ๋ ์ด๋ฏธ์ง์ ๊ฒฝ์ฐ NSCache๋ฅผ ์ด์ฉํด ์บ์ ๋ฉ๋ชจ๋ฆฌ์ ์ ์ฅ๋ ์ด๋ฏธ์ง๋ฅผ ์ฌ์ฉํ  ์ ์๋๋ก ์ค์ ํ๋ค.

### 2) UI

์ ํด์ง UI๊ฐ ์๋ค๋ณด๋ ์ฌ์ค ๋ก์ง์ ๊ตฌํํ๋ ๊ฒ ๋ณด๋ค ๋ฐ์ดํฐ๋ฅผ ์ด๋ป๊ฒ ๋ณด์ฌ์ค์ง๋ฅผ ๋ ๊ณ ๋ฏผํ๋ ๊ฒ ๊ฐ๋ค. 

| Main(1) | Detail(2) |
|:---:|:---:|
| ![Simulator Screen Shot - iPhone 8 - 2022-06-15 at 11 32 07](https://user-images.githubusercontent.com/88618825/173731998-a420a644-5a6f-4afa-95ed-b6dc3f615f10.png) | ![Simulator Screen Shot - iPhone 8 - 2022-06-15 at 12 03 32](https://user-images.githubusercontent.com/88618825/173732052-f96c78ca-2301-4998-b207-855dec814799.png) |

์ฒซ๋ฒ์จฐ ํ๋ฉด์์๋ 20๊ฐ ๋์์ ๋ ์จ ์ ๋ณด๋ฅผ ๊ฐ๋ตํ๊ฒ ํ์ธ ํ  ์ ์์ด์ผ ํ๊ธฐ ๋๋ฌธ์ CollectionView๋ฅผ ์ด์ฉํด View๋ฅผ ๊ตฌ์ฑํ๋ค.

์ฒ์ ๊ตฌํ ํ์ ๋๋ Cell์ backgroundColor๋ฅผ ์ ๋ถ darkGray๋ก ํต์ผ ์์ผฐ๋๋ฐ ํ์ฐฝํ ๋ ์จ์๋ ๋๋ฌด ์น์นํด ๋ณด์ด๋(?) ๋๋์ด ์์ด์ ๋ ์จ๋ณ๋ก ๋ฐฐ๊ฒฝ์์ด ๋ค๋ฅด๊ฒ ์ฌ ์ ์๋๋ก ์ค์ ํ๋ค.

๋คํธ์ํฌ ํต์  ๊ฒฐ๊ณผ icon ๊ฐ์ ๊ธฐ์ค์ผ๋ก
* `01, 02 ,03` -> White (ํด๊ฐ ๋จ๊ฑฐ๋ ์์ ๊ตฌ๋ฆ)
* `04, 09, 10, 11` -> Dark Gray (๋น)
* `13, 50` -> Light Gray (๋, ์๊ฐ)

๊ทธ๋ฆฌ๊ณ  ์ฒซ๋ฒ์งธ ๋ทฐ์ ๊ฒฝ์ฐ `navigation controller` ๋ฅผ ์ด์ฉํด์ ๊ตฌ์ฑํ๋๋ฐ navigation bar๋ฅผ hidden ์ํค๊ณ  ์ถ์๋๋ฐ ์ฌ๊ธฐ์ ๋ฌธ์ ๊ฐ ์กฐ๊ธ ๋ฐ์ํ๋ค.

๋ผ์ดํธ ๋ชจ๋์ธ ๊ฒฝ์ฐ์ ์ํ๋ฐ์ ๊ธ์จ(์๊ฐ, wifi..)๊ฐ ๊ฒ์์์ด์ฌ์ safe area์ background์ ๊ฐ๋ ค์ ธ ๋ณด์ด์ง ์๋ ๋ฌธ์ ๊ฐ ์์๋ค.

```swift
 override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override func viewDidAppear(_ animated: Bool) {
    navigationController?.navigationBar.barStyle = .black
  }
```

์์ ๋ฐฉ๋ฒ์ ํตํด์ ๋ผ์ดํธ ๋ชจ๋์ธ ๊ฒฝ์ฐ์๋ ์ํ๋ฐ์ ๊ธ์จ์์ ์กฐ์ ํ  ์ ์์๋ค.

๋๋ฒ์งธ ๋ทฐ์ ๊ฒฝ์ฐ์๋ ํ๋์ ํ์ด๋ธ๋ทฐ๋ก ๊ตฌ์ฑ๋์ด 2๊ฐ์ ์น์์ผ๋ก ๋๋์ด์ ๊ตฌํํ๋ค. ์ฌ์ค ์ฌ์ฉ์์๊ฒ ๋ณด์ฌ์ค์ผ ํ  ๋ฐ์ดํฐ๊ฐ ๋ง๊ธฐ ๋๋ฌธ์ ์ด๋ฅผ ์ด๋ป๊ฒ ๊ตฌ์ํ ์ง ๊ณ ๋ฏผํ๋ค๊ฐ `AccuWeather`์ ๋์์ธ์
์ฐธ๊ณ ํด์ ๋ง๋ค์๋ค.

๋๋ฒ์งธ ๋ทฐ์์ ๋ณด์ฌ์ค์ผ ํ๋ ๋ฐ์ดํฐ๋ค์ด `List`๋ผ๋ ๊ตฌ์กฐ์ฒด ํ์์ ์ ์ฅ๋์ด ์์ง๋ง Row ๋ณ๋ก ์ด๋ค ๋ฐ์ดํฐ๋ฅผ ๋ณด์ฌ์ค์ผ ํ๋์ง ๊ฐ cell์ด ์ด๋ป๊ฒ ํ๋ณํ  ์ ์์์ง์ ๋ํ ๊ณ ๋ฏผ์ด ๋ง์๋ค.

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
      return "ยฐC"
    case .minimumTemp:
      return "ยฐC"
    case .maximumTemp:
      return "ยฐC"
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
์์ ๊ฐ์ด ์ด๊ฑฐํ์ ํตํด์ indexPath์ row๋ง ์๋ฉด ์ํ๋ ๊ฐ์ ์ค์ ํ  ์ ์๋๋ก ๊ตฌ์ฑํ๋ค.

### 3) ๋คํธ์ํฌ ํต์ 

20๊ฐ ๋์์ ๋ ์จ๋ฅผ ๊ฐ์ ธ์์ผ ํ๋๋ฐ API ํต์  ์ค group์ ํตํด์ ๊ฐ์ ธ์๋ค. ์ฌ๊ธฐ์ ๊ฐ ๋์์ City ID๊ฐ ํ์ํ๋๋ฐ OpenWeather์์ ์ ๊ณตํ๋ city.list.json ํ์ผ์ ํ๋ก์ ํธ์ ๋ฃ๊ณ 
ํ์ํ ๋์ id๋ฅผ ๋์๋ช์ ์ด์ฉํด ํ์ฑํ๋ ๋ฐฉ์์ ์ด์ฉํ๋ ค๊ณ  ํ๋ค๊ฐ city.list.json ํ์ผ์ ์ฉ๋์ด 41.7MB ์ผ๋ก ๋๋ฌด ๋ฌด๊ฑฐ์ด๊ฒ์ผ ํ์ธํ๊ณ  ํ์ํ ๋์๋ค์ id๋ฅผ ๋ชจ์์ plist ํ์ผ๋ก ๋ง๋ค์ด์ ์ฌ์ฉํ๋ค.



