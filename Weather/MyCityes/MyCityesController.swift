//
//  MyCityesController.swift
//  Weather
//
//  Created by Valeria Keshishyan on 03.01.2023.
//

import UIKit

class MyCityesController: UITableViewController {
    
    var cityes = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundView = UIImageView(image: UIImage(named: "water.png"))
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
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // получаем ячейку из пула
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCityesCell", for: indexPath) as! MyCityesCell
        // получаем город для конкретной строки
        let city = cityes[indexPath.row]
        
        // устанавливаем город в надпись ячейки
        cell.CityName.text = city
        
        return cell
    }
    
    @IBAction func addCity(segue: UIStoryboardSegue) {
        // Проверяем идентификатор перехода, чтобы убедится, что это нужный переход
        if segue.identifier == "addCity" {
            // Получаем ссылку на контроллер, с которого осуществлен переход
            let allCityesController = segue.source as! AllCityesController
            
            // получаем индекс выделенной ячейки
            if let indexPath = allCityesController.tableView.indexPathForSelectedRow {
                // получаем город по индексу
                let city = allCityesController.cityes[indexPath.row]
                // Проверяем что такого города нет в списке
                if !cityes.contains(city) {
                    // добавляем город в список выбранных городов
                    cityes.append(city)
                    // обновляем таблицу
                    tableView.reloadData()
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // если была нажата кнопка удалить
        if editingStyle == .delete {
        // мы удаляем город из массива
            cityes.remove(at: indexPath.row)
            // и удаляем строку из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
