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
