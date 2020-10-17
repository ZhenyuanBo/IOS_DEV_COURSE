//property names have to match the names shown in the JSON result

import Foundation

struct WeatherData: Codable{
    let name: String
    let main: Main
    let weather: [Weather]
}


struct Main: Codable{
    let temp: Double
}

struct Weather: Codable{
    let id: Int
}
