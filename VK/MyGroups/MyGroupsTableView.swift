//
//  MyGroupsTableViewController.swift
//  VK
//
//  Created by Lera on 07.05.22.
//

import UIKit

class MyGroupsTableView: UITableViewController {
    
    // добавление выбранной группы в список моих групп
    @IBAction func addSelectedGroup(segue: UIStoryboardSegue) {
        // делаем проверку если источник откуда мы хотим перейти правильный
        if let sourceVC = segue.source as? GroupSearchController,
           // получаем индекс нажатой ячейки
           let indexPath = sourceVC.groupSearchTableView.indexPathForSelectedRow {
            // обращаемся к массиву данных и выбираем ту группу на которую мы нажали
            let group = sourceVC.groups[indexPath.row]
            // проверяем, что этой группы нет в списке моих групп
            if !groups.contains(where: {$0.name == group.name}) {
                // выбираем массив моих групп и добавляем к нему выбранную группу
                groups.append(group)
                // обновляем таблицу
                tableView.reloadData()
            }
        }
        //print(sourceVC)
        //print(segue.destination)
        
    }
    
    var groups = [
        Groups(groupImage: UIImage(named:"nationalGeographic"), groupName: "National Geografic"),
        Groups(groupImage: UIImage(named:"discoveryScience"), groupName: "Discovery Science"),
        Groups(groupImage: UIImage(named:"animalPlanet"), groupName: "Animal Planet"),
        
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // возвращаем количество данных из массива
        return groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // получаем ячейку и проверяем по её идентификатору и по соответствию нужному классу
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell",
                                                       for: indexPath) as? GroupCell else {
            
            preconditionFailure("Error")
        }
        
        // Configure the cell...
        // устанавливаем название и картинку в ячейку
        cell.groupImage.image = groups[indexPath.row].image
        cell.groupName.text = groups[indexPath.row].name
        
        return cell
    }
    

    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    // метод позволяет удалять ячейку свайпом справа налево
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // если была нажата кнопка удалить
        if editingStyle == .delete {
            // удаляем группу из массива
            groups.remove(at: indexPath.row)
            // удаляем строку из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
            //        } else if editingStyle == .insert {
            //            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            //        }
        }
        
    }
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchGroup",
        // проверяем идентификатор и проверяем вью контроллер на который хотим перейти
        // если все это работает,проверяем по какой строке происходит нажатие
        let destinationVC = segue.destination as? GroupSearchController,
        let indexPath = tableView.indexPathForSelectedRow {
            let groupsName = groups[indexPath.row].name
            destinationVC.title = groupsName
        }
    }
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
}


