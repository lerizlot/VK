//
//  GroupSearchViewController.swift
//  VK
//
//  Created by Lera on 12.05.22.
//

import UIKit

class GroupSearchController: UIViewController {
    
    let groups = [
        Groups(groupImage: UIImage(named:"discoveryKnowledge"), groupName: "Discovery Knowledge"),
        Groups(groupImage: UIImage(named:"militaryHistory"), groupName: "Military History"),
        Groups(groupImage: UIImage(named:"natGeoWild"), groupName: "Nat Geo Wild"),
        Groups(groupImage: UIImage(named:"science"), groupName: "Science"),
        Groups(groupImage: UIImage(named:"investigationDiscovery"), groupName: "Investigation Discovery"),
        Groups(groupImage: UIImage(named:"nationalGeographic"), groupName: "National Geografic"),
        Groups(groupImage: UIImage(named:"discoveryScience"), groupName: "Discovery Science"),
        Groups(groupImage: UIImage(named:"animalPlanet"), groupName: "Animal Planet"),
    ]
    
    @IBOutlet weak var groupSearchTableView: UITableView! {
        didSet {
            groupSearchTableView.dataSource = self
            groupSearchTableView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension GroupSearchController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupSearch", for: indexPath) as? GroupCell else {
            
            
            preconditionFailure("Error")
        }
        
        cell.groupImage.image = groups[indexPath.row].image
        cell.groupName.text = groups[indexPath.row].name
        
        // Configure the cell...
        return cell
    }
//
//        var content = cell.defaultContentConfiguration()
//        content.image = groups[indexPath.row].image
//        content.text = groups[indexPath.row].name
//
//        cell.contentConfiguration = content
//
}

extension GroupSearchController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}
