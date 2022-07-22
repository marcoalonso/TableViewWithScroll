//
//  ViewController.swift
//  TableViewWithScroll
//
//  Created by marco rodriguez on 21/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    struct frase {
        let nombre: String
        let numero: Int
    }
    
    var frases : [frase] = [
        frase(nombre: "Hola1", numero: 1),
        frase(nombre: "Hola2", numero: 2),
        frase(nombre: "Hola2", numero: 3)
    ]

    @IBOutlet weak var tablaSimple: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tablaSimple.delegate = self
        tablaSimple.dataSource = self
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return frases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tablaSimple.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        celda.textLabel?.text = frases[indexPath.row].nombre
        return celda
    }
    
    
}
