//
//  homeTableViewCell.swift
//  EnglishForHotelManagement
//
//  Created by sdmgap3 on 2/25/20.
//  Copyright © 2020 Shahid Sabir. All rights reserved.
//

import UIKit

class homeTableViewCell: UITableViewCell {

    @IBOutlet weak var iconLB: UIImageView!
    @IBOutlet weak var tagLB: UILabel!
    @IBOutlet weak var titleLB: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
