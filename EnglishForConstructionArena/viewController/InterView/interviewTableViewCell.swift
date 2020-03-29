//
//  interviewTableViewCell.swift
//  EnglishForHotelManagement
//
//  Created by sdmgap3 on 3/3/20.
//  Copyright © 2020 Shahid Sabir. All rights reserved.
//

import UIKit

class interviewTableViewCell: UITableViewCell {

    @IBOutlet weak var interviewtextBangla: UILabel!
    @IBOutlet weak var interviewtextEnglish: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
