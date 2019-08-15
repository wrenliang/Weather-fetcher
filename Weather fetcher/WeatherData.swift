//
//  WeatherData.swift
//  Weather fetcher
//
//  Created by Wren Liang on 2019-08-15.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

import Foundation

struct AllData: Codable {
    var main: MainWeatherData
    
    enum CodingKeys: String, CodingKey{
        case main = "main"
    }
}


struct MainWeatherData: Codable {
    var temperature: Double
    var tempMax: Double
    var tempMin: Double
    var humidity: Double
    var pressure: Double
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case tempMax = "temp_max"
        case tempMin = "temp_min"
        case humidity
        case pressure
        
    }
}

