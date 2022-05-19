//
//  MyFriendsTableViewController.swift
//  VK
//
//  Created by Lera on 07.05.22.
//

import UIKit

class MyFriendsTableView: UITableViewController {
    
    let friends = [
        Friends(friendImage: UIImage(named:"ulan"), friendName: "Улан Бейшенкулов"),
        Friends(friendImage: UIImage(named:"yuriy"), friendName: "Юрий Зарубин"),
        Friends(friendImage: UIImage(named:"lessy"), friendName: "Олеся Мазур"),
        Friends(friendImage: UIImage(named:"andrey"), friendName: "Андрей Поздняков"),
        Friends(friendImage: UIImage(named:"leshka"), friendName: "Лёшка Сидоренко"),
        Friends(friendImage: UIImage(named:"yaroslav"), friendName: "Ярослав Самборский"),
        Friends(friendImage: UIImage(named:"eugen"), friendName: "Евгений Эдвардсон"),
        Friends(friendImage: UIImage(named:"roman"), friendName: "Роман"),
        Friends(friendImage: UIImage(named:"alexander"), friendName: "Александр Деревенских"),
        Friends(friendImage: UIImage(named:"natalia"), friendName: "Наталья Сафонова"),

    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendCell else {
            
            preconditionFailure("Error")
        }
        
        cell.friendImage.image = friends[indexPath.row].image
        cell.friendName.text = friends[indexPath.row].name

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
    
    /* проверяем идентификатор и вью контроллер на который хотим перейти
     если все верно, проверяем по какой строке произошло нажатие
     на следующий экран передается соответствующая информация: имя друга и его фотографии
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhoto",
        let destinationVC = segue.destination as? PhotoCollectionController,
        let indexPath = tableView.indexPathForSelectedRow {
            let friendName = friends[indexPath.row].name
            destinationVC.title = friendName
        }
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
