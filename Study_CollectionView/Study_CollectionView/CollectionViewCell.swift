//
//  CollectionViewCell.swift
//  Study_CollectionView
//
//  Created by NAMU on 2022/07/16.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "myCell"
    
    let myLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemYellow
        self.contentView.addSubview(myLabel)
        setConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConfiguration() {
        myLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        myLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
    }
}
