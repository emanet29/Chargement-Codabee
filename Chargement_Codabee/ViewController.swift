//
//  ViewController.swift
//  Chargement_Codabee
//
//  Created by Snoopy on 21/08/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var alveoles = [UIImageView]()
    var logo: UIImageView!
    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradient()
        
        ajouterAlveole(valeurX: 0.5, valeurY: 0.5, image: #imageLiteral(resourceName: "honeyComb_empty"))
        ajouterAlveole(valeurX: 0.5, valeurY: 1.5, image: #imageLiteral(resourceName: "honeyComb_empty"))
        ajouterAlveole(valeurX: 0.5, valeurY: 2.5, image: #imageLiteral(resourceName: "honeyComb_empty"))
        ajouterAlveole(valeurX: 1.25, valeurY: 1, image: #imageLiteral(resourceName: "honeyComb_empty"))
        ajouterAlveole(valeurX: 1.25, valeurY: 2, image: #imageLiteral(resourceName: "honeyComb_empty"))
        ajouterAlveole(valeurX: 2, valeurY: 0.5, image: #imageLiteral(resourceName: "honeyComb_empty"))
        ajouterAlveole(valeurX: 2, valeurY: 1.5, image: #imageLiteral(resourceName: "honeyComb_bee"))
        ajouterAlveole(valeurX: 2.75, valeurY: 1, image: #imageLiteral(resourceName: "honeyComb_empty"))
        ajouterAlveole(valeurX: 3.5, valeurY: 0.5, image: #imageLiteral(resourceName: "honeyComb_empty"))
        
        logo = UIImageView(frame: CGRect(x: 0, y: 50, width: view.frame.width, height: 150))
        logo.contentMode = .scaleAspectFit
        logo.image = #imageLiteral(resourceName: "comb_logo")
        view.addSubview(logo)
        
        label = UILabel(frame: CGRect(x: 100, y: 200, width: view.frame.width - 200, height: 50))
        label.text = "Chargement"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor(red: 255 / 255, green: 204 / 255, blue: 0 / 255, alpha: 1)
        view.addSubview(label)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (t) in
            if self.label.text != nil {
                if self.label.text == "Chargement..." {
                    self.label.text = "Chargement"
                } else {
                    self.label.text = (self.label.text!) + "."
                }
            }
            
            let alveole = self.alveoles[Int(arc4random_uniform(UInt32(self.alveoles.count)))]
            if alveole.image == #imageLiteral(resourceName: "honeycomb_full") {
                alveole.image = #imageLiteral(resourceName: "honeyComb_empty")
            } else if alveole.image == #imageLiteral(resourceName: "honeyComb_empty") {
                alveole.image = #imageLiteral(resourceName: "honeycomb_full")
            } else {
                alveole.image = #imageLiteral(resourceName: "honeyComb_bee")
            }
            
            UIView.transition(with: alveole, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
            
        }
        
        
        
        
    }

    func ajouterAlveole(valeurX: CGFloat, valeurY: CGFloat, image: UIImage) {
        let height: CGFloat = 70
        let width: CGFloat = 100
        let x = view.frame.width - (width * valeurX)
        let y = view.frame.height - (height * valeurY)
        let frame = CGRect(x: x, y: y, width: width, height: height)
        let iv = UIImageView(frame: frame)
        iv.image = image
        iv.contentMode = .scaleAspectFit
        
        view.addSubview(iv)
        alveoles.append(iv)
        
    }
    
    func gradient() {
        let gr = CAGradientLayer()
        gr.frame.size = view.frame.size
        gr.colors = [UIColor.white.cgColor,UIColor.black.cgColor]
        gr.startPoint = CGPoint(x: 0, y: 0)
        gr.endPoint = CGPoint(x: 1, y: 1)
        view.layer.addSublayer(gr)
    }
    
    
    
    
    
    
    
    
    
    
    
    

}

