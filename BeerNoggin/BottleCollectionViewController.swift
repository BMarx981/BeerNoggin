//
//  BottleCollectionViewController.swift
//  BeerNoggin
//
//  Created by Marx, Brian on 8/2/17.
//  Copyright © 2017 Marx, Brian. All rights reserved.
//

import UIKit

private let reuseIdentifier = "bottle"

class BottleCollectionViewController: UICollectionViewController {

    var bottles = [Bottle]()
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.backgroundView = UIImageView(image: #imageLiteral(resourceName: "White tile"))
        collectionView?.backgroundView?.alpha = 0.2

        populateBottles()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let bottleDetail = segue.destination as! BottleListDetailViewController
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
 

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bottles.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        let beerNameLabel = cell.viewWithTag(19) as! UILabel
        beerNameLabel.text = bottles[indexPath.item].name //Name Label
        let breweryLabel = cell.viewWithTag(39) as! UILabel
        breweryLabel.text = bottles[indexPath.item].brewery  //Brewery label
        let styleLabel = cell.viewWithTag(28) as! UILabel
        styleLabel.text = bottles[indexPath.item].style  //Style Label
        let alcohol = cell.viewWithTag(29) as! UILabel
        alcohol.text = "\(bottles[indexPath.item].alcohol)% ABV" // Alcohol Label
        let descriptionLabel = cell.viewWithTag(49) as! UILabel
        descriptionLabel.text = bottles[indexPath.item].descriptionOf //Description Label
    
        return cell
    }
    
    func populateBottles() {
        var num = 0
        for _ in 0...20 {
            let bottle = Bottle()
            bottle.name = "Bottle #\(num)"
            bottle.brewery = "Brewery #\(num)"
            bottle.alcohol = Double(num)
            bottle.descriptionOf = "Description #\(num)"
            bottle.style = "Style #\(num)"
            bottles.append(bottle)
            num += 1
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "BottleSelection", sender: Any?)
    }
    */
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
