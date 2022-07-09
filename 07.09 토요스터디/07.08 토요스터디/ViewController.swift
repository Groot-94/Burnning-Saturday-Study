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
        self.greenView.backgroundColor = .green

        self.greenView.addGestureRecognizer(taps)
    }

    @objc func addGesture() {

        if self.greenView.backgroundColor == .green {
            self.greenView.backgroundColor = .black
        } else if self.greenView.backgroundColor == .black {
            self.greenView.backgroundColor = .green
        } else {
            self.greenView.backgroundColor = .red
        }
    }
}

