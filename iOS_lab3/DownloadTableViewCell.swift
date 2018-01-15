//
//  DownloadTableViewCell.swift
//  iOS_lab3
//
//  Created by Admin on 15/01/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class DownloadTableViewCell: UITableViewCell {

    @IBOutlet weak var fileName: UILabel!
    @IBOutlet weak var progress: UILabel!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
