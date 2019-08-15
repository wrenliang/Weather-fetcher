//
//  DataManager.swift
//  Weather fetcher
//
//  Created by Wren Liang on 2019-08-06.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

import Foundation



enum DataManagerError: Error {
    case invalidURL;
}

final class DataManager {
    
    var dataTaskCompletion: Bool {
        didSet {
            if let weather = weatherData {
                let temp = weather.main.temperature
                print(temp)
                
            }
        }
    }
    
    init() {
        self.dataTaskCompletion = false;
    }
    
    func createRetrievalURL(baseURL: String, APIKey: String, city: String) throws -> URL{
        if let fullURL = URL(string: baseURL + city + "&APPID=" + APIKey) {
            return fullURL
        } else {
            throw DataManagerError.invalidURL
        }
        
    }
    
    func retrieveData(retrievalURL: URL){
        let session = URLSession.shared
        print("session created");

        let dataTask = session.dataTask(with: retrievalURL, completionHandler: {
            (data: Data?, response: URLResponse?, error: Error?) in
            
            if let error = error{
                print("Boys we got an error!\n");
                print(error);
            } else if let inData = data{
                weatherData = try! JSONDecoder().decode(AllData.self, from: inData)
            }
            self.dataTaskCompletion = true;
            print("finishing closure");
        })
        
        dataTask.resume();
        print("finished retrieve function");
    }
}
