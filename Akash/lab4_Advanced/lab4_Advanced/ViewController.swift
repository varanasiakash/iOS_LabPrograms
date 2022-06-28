//
//  ViewController.swift
//  lab4_Advanced
//
//  Created by student on 13/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView : UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        UIView.animate(withDuration: 1, animations: {self.imageView.frame.origin.y -= 200})
        { _ in
            UIView.animateKeyframes(withDuration: 1, delay: 0.25, options: [.autoreverse ,.repeat], animations: {self.imageView.frame.origin.y += 200})
        }
        
    }


}

