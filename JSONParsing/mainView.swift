//
//  mainView.swift
//  JSONParsing
//
//  Created by Dagmawi Nadew-Assefa on 2/2/18.
//  Copyright © 2018 Sason. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let collectionViewDisplay: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .yellow
        
        return cv
    }()
    
    
    func setupView() {
        backgroundColor = .yellow
        
        addSubview(collectionViewDisplay)
        
        collectionViewDisplay.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionViewDisplay.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionViewDisplay.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }

}
