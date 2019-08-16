//
//  ViewController.swift
//  Weather fetcher
//
//  Created by Wren Liang on 2019-08-06.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

import UIKit
import Foundation

let kelvinConvert = 273.15
var weatherData: AllData? = nil

class ViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var weatherLabel: UILabel!
    @IBOutlet var displayButton: UIButton!
    @IBOutlet var weatherIconView: UIImageView!
    
    @IBOutlet var VertStackView: UIStackView!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var maxTempLabel: UILabel!
    @IBOutlet var minTempLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    @IBOutlet var pressureLabel: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let dataManager = DataManager();
        let retrievalURL = try! dataManager.createRetrievalURL(baseURL: API.baseURL, APIKey: API.key, city: API.city);
        
        dataManager.retrieveData(retrievalURL: retrievalURL);
        
        weatherLabel.text = API.city + " Weather"
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if let weather = weatherData {
            let currentTemp = String(format: "%.1f", weather.main.temperature - kelvinConvert)
            let maxTemp = String(format: "%.1f", weather.main.tempMax - kelvinConvert)
            let minTemp = String(format: "%.1f", weather.main.tempMin - kelvinConvert)
            
            temperatureLabel.text = "Current Temp: \(currentTemp)C"
            maxTempLabel.text = "High Estimate: \(maxTemp)C"
            minTempLabel.text = "Low Estimate: \(minTemp)C"
            humidityLabel.text = "Humidity: \(weather.main.humidity)%"
            pressureLabel.text = "Pressure: \(weather.main.pressure) hPa"
            
            switch (weather.weatherDescription[0].main) {
            case "Thunderstorm":
                weatherIconView.image = UIImage(named: "thunderstorm")
                break;
            case "Drizzle":
                weatherIconView.image = UIImage(named: "rain")
                break;
            case "Rain":
                weatherIconView.image = UIImage(named: "rain")
                break;
            case "Snow":
                weatherIconView.image = UIImage(named: "snow")
                break;
            case "Atmosphere":
                weatherIconView.image = UIImage(named: "fog")
                break;
            case "Clear":
                weatherIconView.image = UIImage(named: "sun")
                break;
            case "Clouds":
                weatherIconView.image = UIImage(named: "cloudy")
                break;
            default:
                print("Error: unrecognized weather description")
                //throw exception
                    
            }
            
            weatherLabel.isHidden = false;
            VertStackView.isHidden = false;
            weatherIconView.isHidden = false;
        } else {
            //throw error
        }
        
    
    }
    
    
    func updateUI(temperature: Double) {

    }

}
