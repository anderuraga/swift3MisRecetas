//
//  DetailController.swift
//  mis recetas
//
//  Created by Spot Matic SL on 30/09/16.
//  Copyright © 2016 Spot Matic SL. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    
    let seccionDetalle = 0
    let seccionIngredientes = 1
    let seccionPasos = 2
    
    var recipe : Receta!
    @IBOutlet weak var imageRecipe: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageRecipe.image = self.recipe.image
        
        //Nombre de la receta en Menu Navegación
        self.title = self.recipe.name

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Ocultar barra de estado
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    //Accion para cerrar ventana modal que habrimos para hacer Rating Receta
    @IBAction func close ( segue : UIStoryboardSegue ){
        print("funcion close")
    }


}

extension DetailController : UITableViewDataSource{
    
    //Numero de Secciones: Detalle, Ingredientes y Pasos
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    //Celdas por seccion
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numeroFileasEnSeccion = 0
        
        switch section {
            case seccionDetalle:
                numeroFileasEnSeccion = 3
            case seccionIngredientes:
                if let ingredientes = self.recipe.ingredients {
                    numeroFileasEnSeccion = ingredientes.count
                }else{
                    numeroFileasEnSeccion = 1
                }
            
            case seccionPasos:
                if let pasos = self.recipe.steps {
                    numeroFileasEnSeccion = pasos.count
                }else{
                    numeroFileasEnSeccion = 1
                }
            default:
                numeroFileasEnSeccion = 0
            }
        return numeroFileasEnSeccion
        
    }
    
    //Rellenar la celda con valores
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCellRecipe", for: indexPath ) as! RecipeDetailViewCell
        
        
        
        switch indexPath.section {
            //Detalles fijos
            case seccionDetalle:
                
                switch indexPath.row {
                    case 0:
                        cell.titulo.text = "Nombre:"
                        cell.valor.text = self.recipe.name
                    case 1:
                        cell.titulo.text = "Tiempo:"
                        if let tiempo = self.recipe.time {
                            cell.valor.text = "\(tiempo) minutos"
                        }else{
                           cell.valor.text = "Sin tiempo de preparación"
                        }
                    case 2:
                        cell.titulo.text = "Favorita:"
                        if self.recipe.isFavourite{
                            cell.valor.text = "Si"
                        }else{
                            cell.valor.text = "No"
                        }
                    default:
                        break
                }
           
            case seccionIngredientes:
                cell.titulo.text = ""
                if let ingredientes = self.recipe.ingredients {
                    cell.valor.text = ingredientes[indexPath.row]
                }else{
                    cell.valor.text = "Faltan ingredientes en la receta"
                }
            
            case seccionPasos:
                cell.titulo.text = ""
                if let pasos = self.recipe.steps{
                     cell.valor.text = pasos[indexPath.row]
                }else{
                    cell.valor.text = "sencillo y para toda la famillia"
                }
                
                
            default:
                break
            }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var titulo = ""
        switch section {
            case seccionIngredientes:
                titulo = "Ingredientes"
            case seccionPasos:
                titulo = "Pasos"
            default:
                break
        }
        return titulo
    }
    
    
}

extension DetailController : UITableViewDelegate{
    
}
