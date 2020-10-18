//
//  WeatherManager.swift
//  Clima
//
//  Created by Zhenyuan Bo on 2020-10-15.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

//By convention, protocol is supposed to be created in the same file as the class/struct that will use the protocol
protocol WeatherManagerDelegate{
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

//make this struct reusable
struct WeatherManager{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=43785effb898315ce8051d1d0031a504&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitutde: CLLocationDegrees, longitude: CLLocationDegrees){
        let urlString = "\(weatherURL)&lat=\(latitutde)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String){
        if let url = URL(string: urlString){
            //create URL session object 
            let session = URLSession(configuration: .default)
            //give session a task
            //trailing closure
            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data{
                    //must use self to call from current class
                    if let weather = self.parseJSON(safeData){
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            //start task
            task.resume()
        }
        
    }
    
    func parseJSON(_ weatherData: Data)->WeatherModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let cityName = decodedData.name
            let weather = WeatherModel(conditionId: id, cityName: cityName, temperature: temp)
            return weather
        }catch{
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
