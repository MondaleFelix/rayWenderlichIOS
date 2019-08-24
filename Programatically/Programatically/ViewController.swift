//
//  ViewController.swift
//  Programatically
//
//  Created by Mondale on 8/21/19.
//  Copyright © 2019 Mondale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let mainView = MainView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Here is our entry point into our app
        //  view.backgroundColor = .yellow
        view.addSubview(mainView)
        mainView.delegate = self
        mainView.pinToSuperview()
    }
}

extension ViewController: HomeViewDelegate {
    func handleTap() {
        print("Handled Buy button tap")
    }
    
    
}

