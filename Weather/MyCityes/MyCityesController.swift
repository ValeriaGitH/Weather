//
//  MyCityesController.swift
//  Weather
//
//  Created by Valeria Keshishyan on 03.01.2023.
//

import UIKit

class MyCityesController: UITableViewController {
    
    var indexCity = [Int]()
    
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
        return indexCity.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // получаем ячейку из пула
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCityesCell", for: indexPath) as! MyCityesCell
        // получаем город для конкретной строки
        let iCity = indexCity[indexPath.row]
        // устанавливаем город в надпись ячейки
        cell.CityName.text = AllCityesController.cityes[iCity].name
        
        return cell
    }
    
    @IBAction func addCity(segue: UIStoryboardSegue) {
        // Проверяем идентификатор перехода, чтобы убедится, что это нужный переход
        if segue.identifier == "addCity" {
            // Получаем ссылку на контроллер, с которого осуществлен переход
            let allCityesController = segue.source as! AllCityesController
            
            // получаем индекс выделенной ячейки
            if let indexPath = allCityesController.tableView.indexPathForSelectedRow {
                let index = indexPath.row
                // Проверяем что такого города нет в списке
                if !indexCity.contains(index) {
                    // добавляем город в список выбранных городов
                    indexCity.append(index)
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
            indexCity.remove(at: indexPath.row)
            // и удаляем строку из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Segue" {
            
            let nextScene =  segue.destination as! WeatherViewController

            // Pass the selected object to the new view controller.
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedVehicle = indexCity[indexPath.row]
                nextScene.indexCity = selectedVehicle
            }
        }
    }
}
