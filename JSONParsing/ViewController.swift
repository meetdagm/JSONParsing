//
//  ViewController.swift
//  JSONParsing
//
//  Created by Dagmawi Nadew-Assefa on 2/1/18.
//  Copyright © 2018 Sason. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let mainView = MainView()
    let cellID = "cellID"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCell()
        setupDelegate()
        displayProductName()
        
    }
    
    override func loadView() {
        //TODO: implement View
        self.view = mainView
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
       return CourseManager.shared.courses.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = mainView.collectionViewDisplay.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! MainViewCell
        cell.cellData = CourseManager.shared.courses[indexPath.item]
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.width, height: 75)
    }
    
    
    func setupCell() {
        
        mainView.collectionViewDisplay.register(MainViewCell.self, forCellWithReuseIdentifier: cellID)
        
    }
    
    func setupDelegate() {
        
        mainView.collectionViewDisplay.delegate = self
        mainView.collectionViewDisplay.dataSource = self
    
    }
    
    func displayProductName() {
        CourseManager.shared.getProducts { (done) in
            if done {
                DispatchQueue.main.async {
                    self.mainView.collectionViewDisplay.reloadData()
                }
            }else{
                print("Was not able to display Information")
            }
        }
    }

}

