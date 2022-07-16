//
//  CustomLayout.swift
//  Study_CollectionView
//
//  Created by NAMU on 2022/07/16.
//

import UIKit

class CustomLayout: UICollectionViewLayout {
    var attributesArray = [UICollectionViewLayoutAttributes]()
    var numberOfColumns: Int = 4
    var contentWidth : CGFloat {
        self.collectionView?.bounds.width ?? 0
    }
    var width : CGFloat {
        (self.collectionView?.frame.width ?? 0) / 4
    }
    
    override var collectionViewContentSize: CGSize {
        let size = CGSize(width: width , height: width * 1.2)
        return size
    }
    
    override func prepare() {
        super.prepare()
        guard let collectionView = collectionView else {
            return
        }
        
        let columnWidth: CGFloat = contentWidth / CGFloat(numberOfColumns) - 10
        var xOffset: [CGFloat] = []
        
        for column in 0..<numberOfColumns {
            if column == 4 {
                xOffset.append(CGFloat(column) * columnWidth)
            } else {
                xOffset.append(CGFloat(column) * columnWidth + CGFloat(column) * 10)
            }
        }
        
        var column = 0
        var yOffset: [CGFloat] = Array(repeating: 0, count: numberOfColumns)
        
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: columnWidth * 1.2)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = frame
            
            if column == 3 {
                yOffset = yOffset.map {
                    $0 + columnWidth * 1.2 + 10
                }
            }
            
            if column < numberOfColumns - 1 {
                column += 1
            } else {
                column = 0
            }
            
            attributesArray.append(attributes)
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributesArray
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return attributesArray[indexPath.item]
    }
    
    override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
