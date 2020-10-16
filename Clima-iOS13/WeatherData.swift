//property names have to match the names shown in the JSON result

import Foundation

struct WeatherData: Decodable{
    let name: String
    let main: Main
    let weather: [Weather]
}


struct Main: Decodable{
    let temp: Double
}

struct Weather: Decodable{
    let description: String
}
