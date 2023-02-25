//
//  ApiManager.swift
//  DraftUIKit
//
//  Created by Valeria Keshishyan on 23.02.2023.
//

import Foundation

class ApiManager{
    
    static let shared = ApiManager()
    
    let urlString = "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current_weather=true&hourly=temperature_2m,relativehumidity_2m,windspeed_10m"
    
    func Get(completion: @escaping ([Double]) -> Void) {
        guard let url = URL(string: urlString) else {return}
        var request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            
            guard let data else { return }
            //парсинг
            if let weatherData = try? JSONDecoder().decode(WeatherData.self, from: data){
                
                completion(weatherData.hourly.temperature2M)
            }
            
        }
        task.resume()
    }
}
