//
//  ViewController.swift
//  ejemplo-PickerView
//
//  Created by Instructor Fredy Asencios on 6/24/19.
//  Copyright © 2019 AcademiaMoviles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //interantuando con el modal del formulario
    
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtNomArchivo: UITextField!
    
    @IBAction func agrandoCiudad(_ sender: Any) {
        
        let newCiudad = ["nombreCiudad":txtNombre.text!,"nombreAlcalde":"","imagen":txtNomArchivo.text!]
        arrayCiudades.append(newCiudad)
        miPicker.reloadAllComponents()
        cancelandoModal(self)
    }
    
    @IBOutlet var modalFormulario: UIView!
    
    @IBOutlet var fondo: UIVisualEffectView!
    @IBAction func agregandoModalForm(_ sender: Any) {
        let anchoVista = UIScreen.main.bounds.width
        let alturaVista = UIScreen.main.bounds.height
        
        modalFormulario.layer.position = CGPoint(x: anchoVista/2, y: alturaVista/2)
        fondo.frame = CGRect(x: 0, y: 0, width: anchoVista, height: alturaVista)
        self.view.addSubview(fondo)
        self.view.addSubview(modalFormulario)
        
    }
    @IBAction func cancelandoModal(_ sender: Any) {
        fondo.removeFromSuperview()
        modalFormulario.removeFromSuperview()
    }
    
    //
    var paramDatosSelected = [String:String]()
    
    //interaccion con el modal picker
    
    @IBOutlet weak var contenedorPicker: UIView!
    
    @IBAction func presentandoModalPicker(_ sender: Any) {
        cancelandoModal(self)
        contenedorPicker.isHidden = false
    }
    
    @IBAction func ocultandoContenedorPicker(_ sender: Any) {
//        let objSelected = paramDatosSelected
        let nomArchivoImg = paramDatosSelected["imagen"] ?? ""
        contenedorImagen.image = UIImage(named: nomArchivoImg)
        let titulo = paramDatosSelected["nombreCiudad"]
        txtTitulo.text = titulo
        contenedorPicker.isHidden = true
    }
    
    //
    @IBOutlet weak var contenedorImagen: UIImageView!
    
    @IBOutlet weak var txtTitulo: UILabel!
    
    
    var arrayCiudades = [[String:String]]()
    @IBOutlet weak var miPicker: UIPickerView!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayCiudades = ejemploDictionary()
//        miPicker.delegate = self
//        miPicker.dataSource = self
        // Do any additional setup after loading the view.
        contenedorPicker.isHidden = true
    }
    //MARK: - fuente de dato
    func ejemploDictionary()->[[String:String]]{
        let ciudad1 = ["nombreCiudad":"cusco","nombreAlcalde":"JOrge Perez","imagen":"cusco"]
        let ciudad2 = ["nombreCiudad":"Arequipa","nombreAlcalde":"Carlos Castro","imagen":"arequipa"]
        let ciudad3 = ["nombreCiudad":"Lima","nombreAlcalde":"Maria Barron","imagen":"lima"]
        let ciudad4 = ["nombreCiudad":"Tacna","nombreAlcalde":" Julio Garcia","imagen":"tacna"]
        let ciudad5 = ["nombreCiudad":"Tumbes","nombreAlcalde":"Julia Gomez","imagen":"tumbes"]
        
        let arraytempo = [ciudad1,ciudad2,ciudad3,ciudad4,ciudad5]
        return arraytempo
        
    }

    
    
}//class
//MARK: - extension Picker

extension ViewController:UIPickerViewDelegate,UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayCiudades.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let nomCiudad = arrayCiudades[row]["nombreCiudad"]
        //return "fila numero \(row)"
        return nomCiudad
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(row)
        let objSelected = arrayCiudades[row]
        paramDatosSelected = objSelected
        print(objSelected)
        //pintando, asignando valores a los objetos UI
//        let nomArchivoImg = objSelected["imagen"] ?? ""
//        contenedorImagen.image = UIImage(named: nomArchivoImg)
//        let titulo = objSelected["nombreCiudad"]
//        txtTitulo.text = titulo
    }
    
}

