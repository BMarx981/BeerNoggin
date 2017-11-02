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

    //MARK: - Constants
    let beer = Beer()
    let locationManager = CLLocationManager()
    
    //MARK: - Variables
    var beerList = [Beer]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let im = UIImageView(image: #imageLiteral(resourceName: "White tile"))
        im.alpha = 0.5
        collectionView?.backgroundView = im
        
        populateBeerList()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - CollectionViewDataSource
    //*****************************************************//

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection: Int) -> Int {
        
        return beerList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath)
        
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "JustBlackBoard")
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
    
    //MARK: - Dummy data
    func populateBeerList() {

        for i in 0...11 {
            
            var beer = Beer()
            beer.name = "Beer #\(i)"
            beer.brewery = "Brewery #\(i)"
            beer.style = "Style Type \(i)"
            beer.alcohol = Double(i)
            beer.descriptionOf = "Description #\(i)"
            beerList.append(beer)
        }
    }
    
    
    //MARK: - Location Manager
    //*****************************************************//
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[locations.count - 1]
        
        if location.horizontalAccuracy > 0 {
            
            locationManager.stopUpdatingLocation()
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        print(error)
    }

}

