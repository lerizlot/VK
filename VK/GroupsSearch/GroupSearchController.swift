//
//  GroupSearchViewController.swift
//  VK
//
//  Created by Lera on 12.05.22.
//

import UIKit

class GroupSearchController: UIViewController {
    
    
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupSearch", for: indexPath) as! GroupCell
        
       // cell.groupName.text = Groups[indexPath.row]
       // cell.groupImage.image = Groups[indexPath.row]
        
        return cell
    }
}

extension GroupSearchController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
   
}
