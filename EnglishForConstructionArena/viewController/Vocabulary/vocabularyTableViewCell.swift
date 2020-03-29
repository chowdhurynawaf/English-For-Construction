//
//  vocabularyTableViewCell.swift
//  EnglishForHotelManagement
//
//  Created by sdmgap3 on 2/29/20.
//  Copyright © 2020 Shahid Sabir. All rights reserved.
//

import UIKit

class vocabularyTableViewCell: UITableViewCell {
    @IBOutlet weak var vocabularyview: UIView!
    @IBOutlet weak var vocabularyLB: UILabel!
    
    @IBOutlet weak var vocabularyImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        vocabularyview.layer.cornerRadius = 15
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
