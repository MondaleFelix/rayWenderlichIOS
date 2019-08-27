//
//  ViewController.swift
//  AutoLayout
//
//  Created by Mondale on 8/24/19.
//  Copyright © 2019 Mondale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // {} is referred to as closure, or anon. functions
    let supremeImageView: UIImageView = {
        let image = UIImage(named: "supreme")
        let imageView = UIImageView(image: image)
        // This enables autolayout for our imageView
        imageView .translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Join us today for our fun and games!"
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(supremeImageView)
        view.addSubview(descriptionTextView)
        
        setupLayout()
    }
    
    func setupLayout(){
        // Constraints
        
        // Constraints that centerin the X and Y axis
        supremeImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        //Constraint that sets the image 100 pixels from the top
        // Top starts from the notch if on iPhone X
        supremeImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
        // Constraints that specify the width and the height
        supremeImageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        supremeImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        
        descriptionTextView.topAnchor.constraint(equalTo: supremeImageView.bottomAnchor, constant: 150).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

    }

}

