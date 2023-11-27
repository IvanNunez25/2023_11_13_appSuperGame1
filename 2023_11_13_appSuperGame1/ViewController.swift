//
//  ViewController.swift
//  2023_11_13_appSuperGame1
//
//  Created by Ivanovicx Nuñez on 13/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var textoNum: UITextField!
    @IBOutlet weak var textoMensaje: UILabel!
    @IBOutlet weak var labelIntentos: UILabel!
    
    @IBOutlet weak var imageView_gif: UIImageView!
    
    var numeroRandom = 0
    var intentos = 0
    var acertados = 0
    var time = 0
    var timer = Timer()
    
    @IBAction func cambioTexto(_ sender: UITextField) {
        
        if textoNum.text == String(numeroRandom) && time >= 0 {
            
            acertados += 1
            
//            textoMensaje.text = "👏🏽 Ganaste 👏🏽"
//            self.view.backgroundColor = UIColor.green
//            self.view.backgroundColor = #colorLiteral(
//            self.view.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
            
        } 
//        else {
//            
//            if intentos > 1 {
//                intentos -= 1
//                labelIntentos.text = String(intentos)
//                textoMensaje.text = "Vuelve a jugar"
//            } else {
//                intentos -= 1
//                labelIntentos.text = String(intentos)
//                textoMensaje.text = "Fallaste, intentalo de nuevo"
//                self.view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
//                alerta()
//            }
//        }
    }
    
    @IBAction func botonJugar(_ sender: UIButton) {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
        
        
    }
    
    @objc func action() {
        time -= 1
        labelIntentos.text = String(time)
        
        
    }
    
    func alerta() {
        let alerta = UIAlertController(title: "😞😞", message: "Intentalo de nuevo", preferredStyle: .alert)
        
        let jugarOtraVez = UIAlertAction(title: "¿Jugar?", style: .default) {
            (UIAlertAction) in self.inicializar();
        }
        
        alerta.addAction(jugarOtraVez)
        self.present(alerta, animated: true, completion: nil)
        
    }
    
    /* Resetear los vaores que estamos usando */
    func inicializar() {
        
        numeroRandom = Int(arc4random_uniform(10))
        textoNum.text = ""
//        intentos = 3
        time = 30
        acertados = 0
        labelIntentos.text = String(intentos)
        textoMensaje.text = "Número del 0 al 9"
        let color = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        self.view.backgroundColor = color
    }
    
    
    @IBAction func botonOtro(_ sender: UIButton) {
        
        self.viewDidLoad()
    }
    
    
    @IBAction func botonAdios(_ sender: UIButton) {
        
        UIControl().sendAction(#selector(NSXPCConnection.suspend), to: UIApplication.shared, for: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let fuegoGif = UIImage.gifImageWithName("fire-51")
//        imageView_gif.image = fuegoGif
        
        imageView_gif.loadGif(name: "fire-51")
        
        
        inicializar()
    }

    /*
     Domingo 19/11/2023:
        1.- SuperJuego modificado utilizando su creatividad
        2.- App Sobrecarga de operadores
        3.- ¿?
     */

}

