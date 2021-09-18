//
//  DataLoader.swift
//  weatherApp
//
//  Created by Decagon on 09/08/2021.
//

import UIKit

class DataLoader {
  // attributes
  var weatherData: [WeatherMain]?
  var forecastWeatherData: ForecastWeather?
  
  // Methods
  func getJsonData( for city: String,completionHandler: @escaping (WeatherMain)-> ()){
  let urlString =  "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=2de4ef6576e4bf9900a89796db733e9c"
    if let url = URL(string: urlString ){
      URLSession.shared.dataTask(with: url) { data, response, error in
        if let data = data {
          do{
            let json = try JSONDecoder().decode(WeatherMain.self, from: data)
            print(json,"THIS IS THE JSON")
            completionHandler(json)
          }
          catch{
            print("error:\(error.localizedDescription)")
          }
        }
      }.resume()
    }
  }
  
  func getJsonForeCastData( for city: String,completionHandler: @escaping (ForecastWeather)-> ()){
  let urlString =  "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=2de4ef6576e4bf9900a89796db733e9c"
    if let url = URL(string: urlString ){
      URLSession.shared.dataTask(with: url) { data2, response, error in
        if let data2 = data2 {
          do{
            let json = try JSONDecoder().decode(ForecastWeather.self, from: data2)
            print(json,"THIS IS THE FORECAST JSON")
            completionHandler(json)
          }
          catch{
            print("error:\(error.localizedDescription)")
          }
        }
      }.resume()
    }
  }
}

//https://api.openweathermap.org/data/2.5/forecast?q=\(city)&cnt=\(numberOfDays)&appid=\(apiKey)&units=metric
//https://api.openweathermap.org/data/2.5/forecast?q=Lagos,ng&appid=2de4ef6576e4bf9900a89796db733e9c
