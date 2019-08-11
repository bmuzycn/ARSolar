//
//  IconCell.swift
//  ARSolar
//
//  Created by Yu Zhang on 2/9/19.
//  Copyright © 2019 Yu Zhang. All rights reserved.
//

import UIKit

class IconCell: UICollectionViewCell {
    let imageView = UIImageView()
    let label = UILabel()
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    var text: String? {
        didSet {
            label.text = text
            label.textAlignment = .center
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setup() {
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        addSubview(label)
        
        let layoutGuide = contentView.layoutMarginsGuide
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: layoutGuide.topAnchor), imageView.bottomAnchor.constraint(equalTo: label.topAnchor)])
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([label.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor), label.leftAnchor.constraint(equalTo: imageView.leftAnchor), label.rightAnchor.constraint(equalTo: imageView.rightAnchor)])
        
    }
}
