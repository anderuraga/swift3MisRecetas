//
//  ViewController.swift
//  mis recetas
//
//  Created by Spot Matic SL on 22/09/16.
//  Copyright © 2016 Spot Matic SL. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var recipes : [Receta] = []

    override func viewDidLoad() {
        super.viewDidLoad()
       
        //MARK: hardcoded
        var receta = Receta(name: "Calabaza", image: #imageLiteral(resourceName: "calabaza"), time: 3, steps : ["servir y comer"])
        recipes.append(receta)
        recipes.append(receta)
        recipes.append(receta)
        
        receta = Receta(name: "Txori Platano", image: #imageLiteral(resourceName: "platano"), time: 3, steps : ["pelar platano","sacar contenido","rellenar con chorizo"])
        recipes.append(receta)
        recipes.append(receta)
        recipes.append(receta)
        recipes.append(receta)
        recipes.append(receta)
        recipes.append(receta)
        recipes.append(receta)
        recipes.append(receta)
        recipes.append(receta)
        
        receta  = Receta(name: "Pechugas", image : #imageLiteral(resourceName: "pechugas"))
        recipes.append(receta)
        recipes.append(receta)
        recipes.append(receta)
        recipes.append(receta)
        recipes.append(receta)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK: - UITableViewDataSource
  
    // section == columna
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // rows == columna
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    // rellenamos celdas de la tabla
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let receta : Receta = recipes[indexPath.row]
        
        //Crear identificador desde 'storyboard > identify inspector' para la celda : UiTableViewCell
        let cellId = "recipeCell"
        
        //la gestion de las celdas las realiza swift y reutiliza 'ReusableCell' las que no se ven para crear nuevas
        // encolando y desencolando las celdas necesarios 'deque'
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)  as! RecipeCellCustom
        
        
        cell.recipeCellName.text = receta.name
        cell.recipeCellImage.image = receta.image
        if let timeReceta = receta.time{
            cell.recipeCellTime.text = "⏱ \(timeReceta) horas"
        }else{
            cell.recipeCellTime.text = "⏱ 0 horas"
        }
        if let pasos = receta.steps{
            cell.recipeCellStep.text = "Pasos: " + String(pasos.count)
        }else{
            cell.recipeCellStep.text = "único paso"
        }
       
        
        return cell
        
        
    }
    
    
}

