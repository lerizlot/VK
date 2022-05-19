//
//  FriendCell.swift
//  VK
//
//  Created by Lera on 12.05.22.
//

import UIKit

class FriendCell: UITableViewCell {
    
    static let reuseIdentifier = "FriendCell"

    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var friendName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        friendImage.layer.cornerRadius = friendImage.frame.size.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
