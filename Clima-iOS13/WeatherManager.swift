//
//  WeatherManager.swift
//  Clima
//
//  Created by Zhenyuan Bo on 2020-10-15.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=43785effb898315ce8051d1d0031a504&units=metric"
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        if let url = URL(string: urlString){
            //create URL session object
            let session = URLSession(configuration: .default)
            //give session a task
            //trailing closure
            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil{
                    print(error!)
                    return
                }
                
                if let safeData = data{
                    //must use self to call from current class
                    self.parseJSON(weatherData: safeData)
                }
            }
            //start task
            task.resume()
        }
        
    }
    
    func parseJSON(weatherData: Data){
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let cityName = decodedData.name
            let weather = WeatherModel(conditionId: id, cityName: cityName, temperature: temp)
            print(weather.temperatureString)
        }catch{
            print(error)
        }
    }
    
}
