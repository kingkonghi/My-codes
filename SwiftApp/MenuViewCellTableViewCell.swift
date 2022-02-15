//
//  MenuViewCellTableViewCell.swift
//  Cathay
//
//  Created by Kong Yau Lee on 13/11/2021.
//

import UIKit

class MenuViewCellTableViewCell: UITableViewCell {
    
    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var IntroLabel: UILabel!
    @IBOutlet var DiscountLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    


}
