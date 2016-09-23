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
       
        
        var receta = Receta(name: "Calabaza", image: #imageLiteral(resourceName: "calabaza"))
        recipes.append(receta)
        recipes.append(receta)
        recipes.append(receta)
        
        receta = Receta(name: "Txori Platano", image: #imageLiteral(resourceName: "platano"))
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
    
        let receta = recipes[indexPath.row]
        
        //Crear identificador desde 'storyboard > identify inspector' para la celda : UiTableViewCell
        let cellId = "recipeCell"
        
        //la gestion de las celdas las realiza swift y reutiliza 'ReusableCell' las que no se ven para crear nuevas
        // encolando y desencolando las celdas necesarios 'deque'
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = receta.name
        cell.imageView?.image = receta.image
        
        return cell
        
        
    }
    
    
}

