//
//  ViewController.swift
//  FlipCoin
//
//  Created by Alexey on 15.10.2021.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    var coinImageArray: [UIImage] = []
    
    @IBOutlet weak var imageViewOutlet: UIImageView!
    @IBOutlet weak var coinLable: UILabel!
    
    @IBAction func FlipCoinButton(_ sender: UIButton) {
        coinLable.text = ""
        imageViewOutlet.image = nil
        flipCoinImages(imageView: imageViewOutlet, images: coinImageArray)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.05) {
            self.flipCoin()
        }
        soundCoin()
       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       createCoinImageArray(count: 15, name: "Coin")
        coinLable.text = ""
        imageViewOutlet.image = UIImage(named: "Орёл")
    }

    func soundCoin(){
        if let soundURL = Bundle.main.url(forResource: "Coin", withExtension: "mp3") {
            var mySound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
            
            AudioServicesPlaySystemSound(mySound)
            
        }
    }
    
    func flipCoin(){
        let coins = [1,2]
        if let coin = coins.randomElement() {
            coin == 1 ? (coinLable.text = "Орёл") : (coinLable.text = "Решка")
            coin == 1 ? (imageViewOutlet.image = UIImage(named: "Орёл")) : (imageViewOutlet.image = UIImage(named: "Решка"))
           
            
        }
    }
   
    func createCoinImageArray(count: Int, name: String) {
        for i in 1...count {
            guard let imageName = UIImage(named: "\(name)\(i)") else { return }
            coinImageArray.append(imageName)
        
    }
    }
    func flipCoinImages(imageView: UIImageView, images:[UIImage]){
        imageView.animationImages = images
        imageView.animationDuration = 1.0
        imageView.animationRepeatCount = 1
        imageView.startAnimating()
    }


    

}

