//
//  AllCityesController.swift
//  Weather
//
//  Created by Valeria Keshishyan on 03.01.2023.
//

import UIKit

class AllCityesController: UITableViewController {
    
   var cityes = [
            "Moscow",
            "Krasnoyarsk",
            "London",
            "Paris"
        ]
    
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
        cell.CityName.text = city

        return cell
    }
}
