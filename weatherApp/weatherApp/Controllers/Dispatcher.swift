//
//  Dispatcher.swift
//  weatherApp
//
//  Created by Decagon on 12/08/2021.
//

import UIKit

extension ViewController {
  // dispatch function for the current data API call.
  func dispatch() {
    self.dataLoader.getJsonData (for: "Ibadan") {[self] data in
      result = data
      print(result!)
      currentResult = Int((result?.main.temp)!)
      minimumResult = Int((result?.main.temp_min)!)
      maximumResult = Int((result?.main.temp_max)!)
      currentLargeResult = Int((result?.main.temp)!)
      weatherDescription = String((result?.weather[0].main)!)
      
      // Queue for current
      DispatchQueue.main.async {
        
        minimumTemperature.text = "\(minimumResult - 273)º"
        currentTemperature.text = "\(currentResult - 273)º"
        maximumTemperature.text = "\(maximumResult - 273)º"
        currentTempLargeDisplay.text = "\(currentLargeResult - 273)º"
        mainWeatherDescription.text = weatherDescription.uppercased()
        
        // view display IMAGE and Color
        switch mainWeatherDescription.text {
        
        case "CLOUDY","CLOUDS":
          imageView.image = Appstyle.clouds.images
          currentViewDisplay.backgroundColor = Appstyle.clouds.color
          superViewDisplay.backgroundColor = Appstyle.clouds.color
        case "RAIN":
          imageView.image = Appstyle.rainy.images
          currentViewDisplay.backgroundColor = Appstyle.rainy.color
          superViewDisplay.backgroundColor = Appstyle.rainy.color
        case "SUNNY":
          imageView.image = Appstyle.sunny.images
          currentViewDisplay.backgroundColor = Appstyle.sunny.color
          superViewDisplay.backgroundColor = Appstyle.sunny.color
        default:
          imageView.image = Appstyle.others.images
          currentViewDisplay.backgroundColor = Appstyle.others.color
          superViewDisplay.backgroundColor = Appstyle.others.color
        }
      }
    }
  }
  
  // dispatch forecasted function
  func dispatchForecastData(){
    self.dataLoader.getJsonForeCastData(for: "Ibadan") {[weak self] data2 in
      guard let referSelf = self else { return }
      print(data2)
      referSelf.forecastResult = data2
      print(referSelf.forecastResult!)
      
      // Temperature display for the forecasted weather.
      referSelf.displayTemperature1 = Int((referSelf.forecastResult?.list[0].main.temp)!)
      referSelf.displayTemperature2 = Int((referSelf.forecastResult?.list[8].main.temp)!)
      referSelf.displayTemperature3 = Int((referSelf.forecastResult?.list[16].main.temp)!)
      referSelf.displayTemperature4 = Int((referSelf.forecastResult?.list[24].main.temp)!)
      referSelf.displayTemperature5 = Int((referSelf.forecastResult?.list[32].main.temp)!)
      
      // weather description icon display
      referSelf.day1weatherMainDescription = String((referSelf.forecastResult?.list[0].weather[0].main)!)
      referSelf.day2weatherMainDescription = String((referSelf.forecastResult?.list[8].weather[0].main)!)
      referSelf.day3weatherMainDescription = String((referSelf.forecastResult?.list[16].weather[0].main)!)
      referSelf.day4weatherMainDescription = String((referSelf.forecastResult?.list[24].weather[0].main)!)
      referSelf.day5weatherMainDescription = String((referSelf.forecastResult?.list[32].weather[0].main)!)
      
      DispatchQueue.main.async {
        referSelf.temperatureDay1.text = "\(referSelf.displayTemperature1 - 273)º"
        referSelf.temperatureDay2.text = "\(referSelf.displayTemperature2 - 273)º"
        referSelf.temperatureDay3.text = "\(referSelf.displayTemperature3 - 273)º"
        referSelf.temperatureDay4.text = "\(referSelf.displayTemperature4 - 273)º"
        referSelf.temperatureDay5.text = "\(referSelf.displayTemperature5 - 273)º"
        
        // Icon Display for day 1
        switch referSelf.day1weatherMainDescription {
        case "CLOUDS":
          referSelf.tempIconDay1.image = Appstyle.clouds.icons
        case "SUNNY":
          referSelf.tempIconDay1.image = Appstyle.sunny.icons
        case "RAIN":
          referSelf.tempIconDay1.image = Appstyle.rainy.icons
        default:
          referSelf.tempIconDay1.image = Appstyle.others.icons
        }
        
        // Icon Display for day 2
        switch referSelf.day2weatherMainDescription {
        case "CLOUDS":
          referSelf.tempIconDay2.image = Appstyle.clouds.icons
        case "SUNNY":
          referSelf.tempIconDay2.image = Appstyle.sunny.icons
        case "RAIN":
          referSelf.tempIconDay2.image = Appstyle.rainy.icons
        default:
          referSelf.tempIconDay2.image = Appstyle.others.icons
        }
        
        // Icon Display for day 3
        switch referSelf.day3weatherMainDescription {
        case "CLOUDS":
          referSelf.tempIconDay3.image = Appstyle.clouds.icons
        case "SUNNY":
          referSelf.tempIconDay3.image = Appstyle.sunny.icons
        case "RAIN":
          referSelf.tempIconDay3.image = Appstyle.rainy.icons
        default:
          referSelf.tempIconDay3.image = Appstyle.others.icons
        }
        
        // Icon Display for day 4
        switch referSelf.day4weatherMainDescription {
        case "CLOUDS":
          referSelf.tempIconDay4.image = Appstyle.clouds.icons
        case "SUNNY":
          referSelf.tempIconDay4.image = Appstyle.sunny.icons
        case "RAIN":
          referSelf.tempIconDay4.image = Appstyle.rainy.icons
        default:
          referSelf.tempIconDay4.image = Appstyle.others.icons
        }
        
        // Icon Display for day 5
        switch referSelf.day5weatherMainDescription {
        case "CLOUDS":
          referSelf.tempIconDay5.image = Appstyle.clouds.icons
        case "SUNNY":
          referSelf.tempIconDay5.image = Appstyle.sunny.icons
        case "RAIN":
          referSelf.tempIconDay5.image = Appstyle.rainy.icons
        default:
          referSelf.tempIconDay5.image = Appstyle.others.icons
        }
        
        // date changed for the days.
        referSelf.day1.text = getDate(Date(timeIntervalSince1970: Double(((referSelf.forecastResult?.list[0].dt)!))))
        referSelf.day2.text = getDate(Date(timeIntervalSince1970: Double(((referSelf.forecastResult?.list[8].dt)!))))
        referSelf.day3.text = getDate(Date(timeIntervalSince1970: Double(((referSelf.forecastResult?.list[16].dt)!))))
        referSelf.day4.text = getDate(Date(timeIntervalSince1970: Double(((referSelf.forecastResult?.list[24].dt)!))))
        referSelf.day5.text = getDate(Date(timeIntervalSince1970: Double(((referSelf.forecastResult?.list[32].dt)!))))
      }
      func getDate(_ date: Date?) -> String{
        guard let inputDate = date else {
          return ""
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: inputDate)
      }
    }
  }
  
  
}
