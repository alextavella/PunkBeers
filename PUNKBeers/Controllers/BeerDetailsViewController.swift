//
//  BeerDetailsViewController.swift
//  PUNKBeers
//
//  Created by Alex Tavella on 24/11/2017.
//  Copyright © 2017 Alex Tavella. All rights reserved.
//

import UIKit
import Kingfisher

class BeerDetailsViewController: UIViewController {

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbTagline: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var lbAbv: UILabel!
    @IBOutlet weak var lbIbu: UILabel!
    
    var beer: Beer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if beer != nil {
            
            let url = URL(string: beer.image_url)
            self.ivImage.kf.setImage(with: url)
            self.lbName.text = beer.name
            self.lbTagline.text = beer.tagline
            self.lbDescription.text = beer.description
            self.lbAbv.text = String(beer.abv)
            self.lbIbu.text = String(beer.ibu)
        }
    }
}
