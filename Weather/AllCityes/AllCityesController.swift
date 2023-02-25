//
//  AllCityesController.swift
//  Weather
//
//  Created by Valeria Keshishyan on 03.01.2023.
//

import UIKit

struct DataCity{
    let name: String
    let lat: Double
    let lon: Double
}

class AllCityesController: UITableViewController {
    
    var cityes: [DataCity] = {
        [
            .init(name: "Bangkok", lat: 13.75, lon: 100.50),
            .init(name: "Berlin", lat: 52.52, lon: 13.41),
            .init(name: "Moscow", lat: 55.75, lon: 37.62),
            .init(name: "Tokyo", lat: 35.69, lon: 139.69)
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // получаем ячейку из пула
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! AllCityesCell
        // получаем город для конкретной строки
        let city = cityes[indexPath.row]
            
        // устанавливаем город в надпись ячейки
        cell.CityName.text = city.name

        return cell
    }
}
