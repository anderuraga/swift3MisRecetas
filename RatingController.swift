//
//  RatingController.swift
//  mis recetas
//
//  Created by Spot Matic SL on 03/10/16.
//  Copyright © 2016 Spot Matic SL. All rights reserved.
//

import UIKit

class RatingController: UIViewController {

    @IBOutlet weak var backgorundImage: UIImageView!
    var ratingSelected : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //efecto difumindao imagen de fondo
        let blurEfect = UIBlurEffect(style: .dark)
        let blurEfectView = UIVisualEffectView(effect: blurEfect)
        //obtener todo el ancho pantalla
        blurEfectView.frame = view.bounds
        //aplicar el efecto mediante la nueva view creada
        backgorundImage.addSubview(blurEfectView)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    @IBAction func ratingButtonCliked(_ sender: UIButton) {
        switch sender.tag {
            case 1:
                ratingSelected = "dislike"
            case 2:
                ratingSelected = "good"
            case 3:
                ratingSelected = "great"
            default:
                break
        }
        
        //Volver atras, forzar segue
        performSegue(withIdentifier: "unwidToDetailController", sender: sender)
        
    }

   }
