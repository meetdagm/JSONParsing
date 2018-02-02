//
//  mainViewCellCollectionViewCell.swift
//  JSONParsing
//
//  Created by Dagmawi Nadew-Assefa on 2/2/18.
//  Copyright © 2018 Sason. All rights reserved.
//

import UIKit

class MainViewCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var cellData: Course? {
        didSet{
            guard let unwrappedData = cellData else {return}
            productTitle.text = unwrappedData.name
        }
    }
    
    
    let productTitle: UILabel = {
       
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont(name: "Avenir-Medium", size: 16)
        title.textColor = .black
        
        return title
    }()
    
    func setupView() {
        backgroundColor = .white
        
        addSubview(productTitle)
        productTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        productTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 18).isActive = true
        
    }
    
}
