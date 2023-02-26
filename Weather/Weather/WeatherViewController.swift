//
//  WeatherViewController.swift
//  Weather
//
//  Created by Valeria Keshishyan on 03.01.2023.
//

import UIKit

class WeatherViewController: UICollectionViewController {
    
    var indexCity: Int? = nil
    
    private var temperatureData: [Double] = []
    private var temperatureDataTime: [String] = []
    private var temperatureCode: [Int] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        guard let index = indexCity else {return}
        
        title = AllCityesController.cityes[index].name
        
        let lat: Double = AllCityesController.cityes[index].lat
        let lon: Double = AllCityesController.cityes[index].lon
        
        ApiManager.shared.GetWeather(lat:lat, lon: lon) { [weak self] values, times, code in
            DispatchQueue.main.async {
                guard let self else { return }
                self.temperatureData = values
                self.temperatureDataTime = times
                self.temperatureCode = code
                self.collectionView.reloadData()
            }
        }
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return temperatureData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        
        cell.weather.text = "\(temperatureData[indexPath.item])"
        cell.time.text = temperatureDataTime[indexPath.item]
        cell.icon.image = UIImage(named: "code_\(temperatureCode[indexPath.item]).png")
        
        return cell
    }
    
}
