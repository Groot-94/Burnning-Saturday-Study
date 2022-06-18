//
//  CustomTableViewCell.swift
//  0618스터디(테이블뷰)
//
//  Created by 언체인, 현이, 그루트, 키위 on 2022/06/18.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
