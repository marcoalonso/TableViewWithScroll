//
//  OtroViewController.swift
//  TableViewWithScroll
//
//  Created by marco rodriguez on 24/07/22.
//

import UIKit



class PlayerViewController: UIViewController {

    @IBOutlet weak var imageIcon: UIImageView!
    
    @IBOutlet weak var buttonPlayStop: UIButton!
    @IBOutlet weak var player: VideoPlayer!
    
    var isPlaying: Bool = false
    var play1stTime: Bool = false
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //player.playVideoWithFileName("meditar", ofType: "mp4")
        //true al arrancar
//        isPlaying = !isPlaying
//        buttonPlayStop.setImage(UIImage(systemName: "pause.circle"), for: .normal)
        
        
    }
    
    
    
    @IBAction func stopplay(_ sender: UIButton) {
        //Cada que selecciona el boton hacerlo visible
        buttonPlayStop.layer.opacity = 1
        imageIcon.layer.opacity = 1
        
        //Timer 3 segundos para ocultar el boton
        _ = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(hideButton), userInfo: nil, repeats: true)
        
        //si esta reproduciendo
        if isPlaying {
            player.stopVideo()
            //cambia a false
            isPlaying = !isPlaying
            buttonPlayStop.setImage(UIImage(systemName: "play"), for: .normal)
            imageIcon.image = UIImage(systemName: "play")
            
        } else {
            //comienza a reproducir
            if !play1stTime {
                //si es la primera vez?
                player.playVideoWithFileName("meditar", ofType: "mp4")
                isPlaying = !isPlaying
                buttonPlayStop.setImage(UIImage(systemName: "pause.circle"), for: .normal)
                imageIcon.image = UIImage(systemName: "pause.circle")
                play1stTime = true
            } else {
                //
                player.resumeVideo()
                //cambia a true
                isPlaying = !isPlaying
                buttonPlayStop.setImage(UIImage(systemName: "pause.circle"), for: .normal)
                imageIcon.image = UIImage(systemName: "pause.circle")
            }
        }
    }
    
    @objc func hideButton(){
        //Si esta detenido
        if !isPlaying {
            buttonPlayStop.layer.opacity = 1
            imageIcon.layer.opacity = 1
        } else {
            buttonPlayStop.layer.opacity = 0.1
            imageIcon.layer.opacity = 0.1
        }
        
    }
    
    

}
