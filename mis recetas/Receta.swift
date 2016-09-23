//
//  Receta.swift
//  mis recetas
//
//  Created by Spot Matic SL on 23/09/16.
//  Copyright © 2016 Spot Matic SL. All rights reserved.
//

import Foundation
import UIKit

class Receta : NSObject{
    
    var name : String!
    var image : UIImage!
    var time : Int!
    var ingredient: [String]!
    var steps : [String]!
    
    init( name: String) {
        self.name = name
    }
    
    
    
}
