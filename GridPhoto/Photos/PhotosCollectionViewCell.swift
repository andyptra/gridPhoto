//
//  PhotosCollectionViewCell.swift
//  GridPhoto
//
//  Created by andyptra on 5/20/20.
//  Copyright © 2020 andyptra. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageThumb: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        // Initialization code
    }
    
    func setupUI() {
        
        imageThumb.layer.cornerRadius = 5.0
        imageThumb.clipsToBounds = true
        imageThumb.contentMode = .scaleAspectFill
        imageThumb.translatesAutoresizingMaskIntoConstraints = false
    }
    class func nib() -> UINib {
        return UINib(nibName: "PhotosCollectionViewCell", bundle: nil)
    }
}
