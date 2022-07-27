//
//  ViewController.swift
//  TableViewWithScroll
//
//  Created by marco rodriguez on 21/07/22.
//

import UIKit
import youtube_ios_player_helper

class HomeViewController: UIViewController {
    
    struct frase {
        let nombre: String
        let numero: Int
    }
    
    var frases : [frase] = [
        frase(nombre: "Youtube Helper", numero: 1),
        frase(nombre: "AVPlayer", numero: 2),
        frase(nombre: "Hola3", numero: 3)
    ]
    
    
    
    
  
    
    
    @IBOutlet weak var tablaSimple: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        setupNavBar()
        
        tablaSimple.delegate = self
        tablaSimple.dataSource = self
    }
    
    func setupNavBar(){
        //Cambiar el nombre al boton de Back
        navigationController?.navigationBar.topItem?.title = ""

        //Cambiar el titulo del VC
        self.navigationItem.title = "Alonso"

        //Large Titles
//                self.prefersLargeTitles = true
        //Titulo del VC
        navigationItem.title = "Nombre del VC"
                let nav = self.navigationController?.navigationBar
        //Color del titulo del VC
                nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.purple]
        //Color del botón back
                nav?.tintColor = .black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }


}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return frases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tablaSimple.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        celda.textLabel?.text = frases[indexPath.row].nombre
        celda.selectionStyle = .none
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tablaSimple.deselectRow(at: indexPath, animated: false)
        performSegue(withIdentifier: "\(frases[indexPath.row].numero)", sender: self)
        print(frases[indexPath.row].numero)
    }
    
    //quitar la sombra al seleccionar un elemento en la uitableView
    
    
}
