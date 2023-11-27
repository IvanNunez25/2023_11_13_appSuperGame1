//
//  ViewController2.swift
//  2023_11_13_appSuperGame1
//
//  Created by Ivanovicx Nuñez on 26/11/23.
//

import UIKit

class ViewController2: UIViewController {
    
    
    @IBOutlet weak var text_numeroRandom: UITextField!
    
    @IBOutlet weak var imageView_gif: UIImageView!
    
    @IBOutlet weak var label_tiempoRestante: UILabel!
    @IBOutlet weak var label_aciertos: UILabel!
    
    @IBOutlet weak var segmentedControl_segundos: UISegmentedControl!
    
    var time = 0
    var timer = Timer()
    var numeroRandom = 0
    var acertados = 0
    
    @IBAction func segementedControl_segundos(_ sender: Any) {
        
        switch segmentedControl_segundos.selectedSegmentIndex {
            
            case 0:
                label_tiempoRestante.text = "10"
                time = 10
                break
            
            case 1:
                label_tiempoRestante.text = "20"
                time = 20
                break
                
            case 2:
                label_tiempoRestante.text = "30"
                time = 30
                break
            
            default:
                break
        }
    }
    
    @IBAction func text_numeroRandom(_ sender: Any) {
        
        if text_numeroRandom.text != "" && time >= 0 {
            
            if(text_numeroRandom.text == String(numeroRandom)) {
                acertados += 1
                numeroRandom = Int(arc4random_uniform(10))
                
                label_aciertos.text = String(acertados)
            }
            
        }
    }
    
    @IBAction func button_jugar(_ sender: Any) {
        
        switch segmentedControl_segundos.selectedSegmentIndex {
            
            case 0:
                time = 10
                break
            
            case 1:
                time = 20
                break
                
            case 2:
                time = 30
                break
            
            default:
                break
        }
        
        text_numeroRandom.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
    }
    
    @IBAction func button_otro(_ sender: Any) {
        inicializar()
    }
    
    @IBAction func button_salir(_ sender: Any) {
        UIControl().sendAction(#selector(NSXPCConnection.suspend), to: UIApplication.shared, for: nil)
    }
    
    
    @objc func action() {
        time -= 1
        label_tiempoRestante.text = String(time)
        
        if(time == 0) {
            timer.invalidate()
            text_numeroRandom.isEnabled = false
            alerta()
        }
    }
    
    func alerta() {
        let alerta = UIAlertController(title: "Timepo terminado", message: "¡Intentalo de nuevo!", preferredStyle: .alert)
        
        let jugarOtraVez = UIAlertAction(title: "Aceptar", style: .default) {
            (UIAlertAction) in self.inicializar();
        }
        
        alerta.addAction(jugarOtraVez)
        self.present(alerta, animated: true, completion: nil)
        
    }
    
    func inicializar() {
        
        switch segmentedControl_segundos.selectedSegmentIndex {
            
            case 0:
                time = 10
                break
            
            case 1:
                time = 20
                break
                
            case 2:
                time = 30
                break
            
            default:
                break
        }
        
        numeroRandom = Int(arc4random_uniform(10))
        acertados = 0
        text_numeroRandom.isEnabled = false
        
        label_aciertos.text = String(acertados)
        label_tiempoRestante.text = String(time)
        
        timer.invalidate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let fuegoGif = UIImage.gifImageWithName("fire-51")
//        imageView_gif.image = fuegoGif
        
        imageView_gif.loadGif(name: "fire-102")
        inicializar()
        
    }

}
