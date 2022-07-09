//
//  ViewController.swift
//  07.08 토요스터디
//
//  Created by 🦈⛓️🥝🪴 on 2022/07/08.
//

import UIKit

class ViewController: UIViewController {
        
    @IBOutlet weak var greenView: GreenView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let taps = UITapGestureRecognizer(target: self, action: #selector(addGesture))
        self.greenView.backgroundColor = .systemGreen
        
        self.greenView.addGestureRecognizer(taps)
    }
    
    @objc func addGesture() {
        if greenView.backgroundColor?.resolvedColor(with: greenView.traitCollection) == UIColor.systemGreen.resolvedColor(with: greenView.traitCollection) {
            greenView.backgroundColor = .systemBlue
        } else {
            if greenView.backgroundColor?.resolvedColor(with: greenView.traitCollection) == UIColor.systemBlue.resolvedColor(with: greenView.traitCollection) {
                greenView.backgroundColor = .systemGreen
            }
        }
    }
}

