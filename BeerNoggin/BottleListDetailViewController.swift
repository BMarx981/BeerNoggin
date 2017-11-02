//
//  BottleListDetailViewController.swift
//  BeerNoggin
//
//  Created by Marx, Brian on 11/2/17.
//  Copyright © 2017 Marx, Brian. All rights reserved.
//

import UIKit

class BottleListDetailViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var brewery: UILabel!
    @IBOutlet weak var style: UILabel!
    @IBOutlet weak var alcohol: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
