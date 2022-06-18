//
//  TableViewCell.swift
//  0618스터디(테이블뷰)
//
//  Created by unchain on 2022/06/18.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var whatImage: UIImageView!
    @IBOutlet weak var whatLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
