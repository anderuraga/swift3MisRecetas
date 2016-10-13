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
        
        //congigurar barra de navegación para el siguiente controlador, ya no se muesta "Mis Recetas"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
       
        //MARK: hardcoded
        var ingredientes = ["patatas de la vera con ojitos y mas cosas para que estoocupe mas de dos lineas","huevos","aceite","sal","cebolla"]
        var receta = Receta(name: "Calabaza", image: #imageLiteral(resourceName: "calabaza"), time: 3, steps : ["servir y comer"])
        receta.ingredients = ingredientes
        recipes.append(receta)
        
        
        receta = Receta(name: "Txori Platano Menuda Guarrdindongada∫", image: #imageLiteral(resourceName: "platano"), time: 3, steps : ["pelar platano con cuidado de no romper cascara","sacar contenido","rellenar con chorizo que previamente hemos freido un poco"])
        ingredientes = ["platano","chorizo"]
        receta.ingredients = ingredientes
        recipes.append(receta)
        
        receta  = Receta(name: "Pechugas", image : #imageLiteral(resourceName: "pechugas"))
        recipes.append(receta)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK: - UITableViewDataSources
  
    // section == columna
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // rows == columna
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    //rellenamos celdas de la tabla
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let receta : Receta = recipes[indexPath.row]
        
        //Crear identificador desde 'storyboard > identify inspector' para la celda : UiTableViewCell
        let cellId = "recipeCell"
        
        //la gestion de las celdas las realiza swift y reutiliza 'ReusableCell' las que no se ven para crear nuevas
        // encolando y desencolando las celdas necesarios 'deque'
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)  as! RecipeCellCustom
        
        cell.recipeCellImage.image = receta.image
        cell.recipeCellImage.layer.cornerRadius = 55.0
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
    
    //editingStyle - Eliminar una celda al desplzarla
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            recipes.remove(at: indexPath.row)
            
            //es mas optimo que usar self.tableView.reloadData
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
    
    //editingActionForRowAt - Acciones para las celas
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let recipe = self.recipes[indexPath.row]
        
        //accion compartir : Crear cuenta Twitter o Facebook en el emulador
        let shareAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
            
            let shareActionText = "Me ha gustado esta receta \(recipe.name!) en APP Recetas"
            
            //mostrar actividad compartir
            let activityController = UIActivityViewController(activityItems: [shareActionText, recipe.image], applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
        }
        shareAction.backgroundColor = UIColor(colorLiteralRed: 30.0/255.0, green: 164.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        
        
        //accion Borrar
        let deleteAction = UITableViewRowAction(style: .default, title: "Eliminar") { (action, indexPath) in
            self.recipes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        
        return [shareAction, deleteAction]
    }
    
    
    //MARK: - UITableViewDelegates
    
    //didSelectRowAt seleccionar la celda de la tabla
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        /*
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
      */
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if ( segue.identifier == "segueRecipeDetail" ){
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedRecipe = self.recipes[indexPath.row]
                let destinationViewController = segue.destination as! DetailController
                destinationViewController.recipe = selectedRecipe
            }
            
        }
        
    }
    
    
    
    
}

