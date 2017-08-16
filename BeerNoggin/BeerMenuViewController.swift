//
//  ViewController.swift
//  BeerNoggin
//
//  Created by Marx, Brian on 7/31/17.
//  Copyright © 2017 Marx, Brian. All rights reserved.
//

import UIKit
import CoreLocation

let reuseId = "beerId"
class BeerMenuViewController: UICollectionViewController, CLLocationManagerDelegate {

    var beerList = [Beer]()
    let beer = Beer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundView = UIImageView(image: #imageLiteral(resourceName: "White tile"))
        populateBeerList()
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection: Int) -> Int {
        return beerList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath)
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "BlackBoard")
        cell.contentView.sendSubview(toBack: imageView)
        let beerNameLabel = cell.viewWithTag(10) as! UILabel
        beerNameLabel.text = beerList[indexPath.item].name //Name Label
        let breweryLabel = cell.viewWithTag(20) as! UILabel
        breweryLabel.text = beerList[indexPath.item].brewery  //Brewery label
        let styleLabel = cell.viewWithTag(22) as! UILabel
        styleLabel.text = beerList[indexPath.item].style  //Style Label
        let alcohol = cell.viewWithTag(30) as! UILabel
        alcohol.text = String(beerList[indexPath.item].alcohol) // Alcohol Label
        let descriptionLabel = cell.viewWithTag(40) as! UILabel
        descriptionLabel.text = beerList[indexPath.item].descriptionOf //Description Label
        
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func populateBeerList() {
        var num = 0
        for _ in 0...11 {
            var beer = Beer()
            beer.name = "Beer #\(num)"
            beer.brewery = "Brewery #\(num)"
            beer.style = "Style Type \(num)"
            beer.alcohol = Double(num)
            beer.descriptionOf = "Description #\(num)"
            num += 1
            beerList.append(beer)
            
        }
    }

}

