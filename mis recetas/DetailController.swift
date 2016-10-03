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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageRecipe.image = self.recipe.image

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func close ( segue : UIStoryboardSegue ){
        print("funcion close")
    }


}

extension DetailController : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCellRecipe", for: indexPath ) as! RecipeDetailViewCell
         /*
        switch indexPath.row {
        case 0:
            cell.titulo.text = "Nombre:"
            cell.valor.text = self.recipe.name
        case 1:
            cell.titulo.text = "Tiempo:"
            cell.valor.text = String(self.recipe.time) + " horas"
            
       
        case 2:
            cell.titulo.text = "Pasos:"
            var ingredientes = ""
            for ingrediente in self.recipe.ingredient {
                ingredientes = ingredientes + "\n" + ingrediente
            }
            cell.valor.text = ingredientes
       
        case 2:
            cell.titulo.text = "Ingredientes:"
            cell.valor.text = self.recipe.ingredient
                 //TODO aumentar numberOfRowsInSection y rellenar resto de campos
            
        default:
            break
        }
         */

        
        return cell
    }
    
    
}

extension DetailController : UITableViewDelegate{
    
}
