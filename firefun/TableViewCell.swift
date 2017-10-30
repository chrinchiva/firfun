//
//  TableViewCell.swift
//  firefun
//
//  Created by petersoeun on 10/26/17.
//  Copyright © 2017 RoboCam. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var UsernameLabelView: UILabel!
    @IBOutlet weak var PasswordLabelView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
