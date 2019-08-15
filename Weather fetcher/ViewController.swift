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
            var currentTemp = String(format: "%.1f", weather.main.temperature - kelvinConvert)
            var maxTemp = String(format: "%.1f", weather.main.tempMax - kelvinConvert)
            var minTemp = String(format: "%.1f", weather.main.tempMin - kelvinConvert)
            
            temperatureLabel.text = "Current Temp: \(currentTemp)C"
            maxTempLabel.text = "High Estimate: \(maxTemp)C"
            minTempLabel.text = "Low Estimate: \(minTemp)C"
            humidityLabel.text = "Humidity: \(weather.main.humidity)%"
            pressureLabel.text = "Pressure: \(weather.main.pressure) hPa"
            
            weatherLabel.isHidden = false;
            VertStackView.isHidden = false;
        } else {
            //throw error
        }
        
    
    }
    
    
    func updateUI(temperature: Double) {

    }

}
