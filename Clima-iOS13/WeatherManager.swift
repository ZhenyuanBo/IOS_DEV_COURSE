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
            let task = session.dataTask(with: url, completionHandler:handle(data:response:error:))
            //start task
            task.resume()
        }
        
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?)->Void{
        if error != nil{
            print(error!)
            return
        }
        
        if let safeData = data{
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
    }
}
