//
//  WeatherViewController.swift
//  Weather
//
//  Created by Valeria Keshishyan on 03.01.2023.
//

import UIKit

class WeatherViewController: UICollectionViewController {
    
    var name: String? = nil
    
    private var temperatureData: [Double] = []
    
    override func viewDidLoad() {
        title = name
        
        super.viewDidLoad()
        
        ApiManager.shared.Get{ [weak self] values in
            DispatchQueue.main.async {
                guard let self else { return }
                self.temperatureData = values
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
        cell.time.text = "30.08.2017 18:00"
        
        return cell
    }
    
}
