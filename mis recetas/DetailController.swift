//
//  DetailController.swift
//  mis recetas
//
//  Created by Spot Matic SL on 30/09/16.
//  Copyright © 2016 Spot Matic SL. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    
    
    var recipe : Receta!
    @IBOutlet weak var imageRecipe: UIImageView!
    @IBOutlet weak var recipeLabelName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageRecipe.image = self.recipe.image
        self.recipeLabelName.text = self.recipe.name
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
