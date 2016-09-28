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
        
        
        receta = Receta(name: "Txori Platano Menuda Guarrdindongada∫", image: #imageLiteral(resourceName: "platano"), time: 3, steps : ["pelar platano","sacar contenido","rellenar con chorizo"])
        recipes.append(receta)
        
        receta  = Receta(name: "Pechugas", image : #imageLiteral(resourceName: "pechugas"))
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
        
        cell.recipeCellImage.image = receta.image
        cell.recipeCellImage.layer.cornerRadius = 42.0
        cell.recipeCellImage.clipsToBounds = true
        
        
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
        
        if ( receta.isFavourite ){
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
 
        return cell
    }
    
    //MARK: editingStyle - Eliminar una celda al desplzarla
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            recipes.remove(at: indexPath.row)
            
            //es mas optimo que usar self.tableView.reloadData
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }

    
    
    //MARK: - UITableViewDelegate al seleccionar la celda de la tabla
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let receta = recipes[indexPath.row]
        
        //Alerta
        let alertController = UIAlertController(title: "", message: "Valora esta receta", preferredStyle: .alert)
        
        
        //Acciones para alerta
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil )
        alertController.addAction(cancelAction)
        
        var favouriteTile = "Favorito"
        var favouriteStyle = UIAlertActionStyle.default
        if (receta.isFavourite){
            favouriteTile = "Ya no me gusta"
            favouriteStyle = UIAlertActionStyle.destructive
        }
        
        let actionFavourite = UIAlertAction(title: favouriteTile, style: favouriteStyle) { (action) in
            receta.isFavourite = !receta.isFavourite
            //refrescar datos de la tabla
            self.tableView.reloadData()
        }
        
        alertController.addAction(actionFavourite)
        
        //mostrar alerta
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    
    
    
}

