//
//  UIImageView+Ext.swift
//  GridPhoto
//
//  Created by andyptra on 5/21/20.
//  Copyright © 2020 andyptra. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func borderImage (radius: CGFloat){
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
