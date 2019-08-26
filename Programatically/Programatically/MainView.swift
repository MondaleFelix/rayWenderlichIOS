//
//  MainView.swift
//  Programatically
//
//  Created by Mondale on 8/24/19.
//  Copyright © 2019 Mondale. All rights reserved.
//

import UIKit

protocol HomeViewDelegate {
    func handleTap() -> Void
}

class MainView: UIView {
    
    var delegate: HomeViewDelegate? = nil
    
    let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "supreme"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = ""
        label.textAlignment = .center
        return label
    }()
    
    private lazy var button: UILabel = {
        let button = UILabel(frame: .zero)
        button.text = " "
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(buttonTapped))
        button.addGestureRecognizer(tapGestureRecognizer)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    @objc func buttonTapped() {
        delegate?.handleTap()
    }
    
    init() {
        super.init(frame: .zero)
        
        addSubviews([label, imageView, button])
        installConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func installConstraints() {
        let height: CGFloat = 250
        let width: CGFloat = 350
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: height),
            imageView.widthAnchor.constraint(equalToConstant: width),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.centerXAnchor.constraint(equalTo: label.centerXAnchor),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10)
            ])
        
        
    }
}

extension UIView {
    func addSubviews(_ views: [UIView]) {
        _ = views.map { addSubview($0) }
    }
    
    func pinToSuperview() {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor)])
    }
}
