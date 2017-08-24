//
//  FoodAndBeerFinder.swift
//  BeerNoggin
//
//  Created by Marx, Brian on 8/1/17.
//  Copyright © 2017 Marx, Brian. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class FoodAndBeerFinder {
    
    let food = Food()
    let beer = Beer()
    
    func makeCall() {
        let link = "http://www.beernoggin.com/tap-list/"
        let url = URL(string: link)
        
    }
}
