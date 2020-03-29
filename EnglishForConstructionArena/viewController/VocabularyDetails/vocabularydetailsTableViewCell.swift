//
//  vocabularydetailsTableViewCell.swift
//  EnglishForHotelManagement
//
//  Created by sdmgap3 on 3/1/20.
//  Copyright © 2020 Shahid Sabir. All rights reserved.
//

import UIKit

class vocabularydetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var vocabularyenglish: UILabel!
    
    @IBOutlet weak var vocabularyBangla: UILabel!
    @IBOutlet weak var vocabularyMeining: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
