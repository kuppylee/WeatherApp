//
//  ViewController.swift
//  weatherApp
//
//  Created by Decagon on 06/08/2021.
//

import UIKit

// UILabel Variable Declaration for Current weather display
class ViewController: UIViewController {
  @IBOutlet weak var minimumTemperature: UILabel!
  @IBOutlet weak var currentTemperature: UILabel!
  @IBOutlet weak var maximumTemperature: UILabel!
  @IBOutlet weak var currentTempLargeDisplay: UILabel!
  @IBOutlet weak var mainWeatherDescription: UILabel!
  
  // UILabel Variable Declaration for Forecast weather display
  @IBOutlet weak var temperatureDay1: UILabel!
  @IBOutlet weak var temperatureDay2: UILabel!
  @IBOutlet weak var temperatureDay3: UILabel!
  @IBOutlet weak var temperatureDay4: UILabel!
  @IBOutlet weak var temperatureDay5: UILabel!
  @IBOutlet weak var day1: UILabel!
  @IBOutlet weak var day2: UILabel!
  @IBOutlet weak var day3: UILabel!
  @IBOutlet weak var day4: UILabel!
  @IBOutlet weak var day5: UILabel!
  
  
  // UIImageView variable declaration for the Forecast weather display
  @IBOutlet weak var tempIconDay1: UIImageView!
  @IBOutlet weak var tempIconDay2: UIImageView!
  @IBOutlet weak var tempIconDay3: UIImageView!
  @IBOutlet weak var tempIconDay4: UIImageView!
  @IBOutlet weak var tempIconDay5: UIImageView!
  
  
  
  //View variable Declaration
  @IBOutlet weak var superViewDisplay: UIView!
  @IBOutlet weak var currentViewDisplay: UIView!
  @IBOutlet weak var imageView: UIImageView!
  
  // current weather label display variable declaration
  var result: WeatherMain?
  var currentResult: Int = 0
  var minimumResult: Int = 0
  var maximumResult: Int = 0
  var currentLargeResult: Int = 0
  var weatherDescription: String = ""
  
  // forecast weather label display variable declaration
  var forecastResult: ForecastWeather?
  var displayTemperature1: Int = 0
  var displayTemperature2: Int = 0
  var displayTemperature3: Int = 0
  var displayTemperature4: Int = 0
  var displayTemperature5: Int = 0
  
  
  var day1weatherMainDescription: String = ""
  var day2weatherMainDescription: String = ""
  var day3weatherMainDescription: String = ""
  var day4weatherMainDescription: String = ""
  var day5weatherMainDescription: String = ""
  
  
  //INSTANTIATION OF THE DATA LOADER CLASS
  let dataLoader = DataLoader()
  
  // VIEW CONTROLLER METHODS
  override func viewDidLoad() {
    super.viewDidLoad()
    dispatch()
    dispatchForecastData()
    
  }
}

