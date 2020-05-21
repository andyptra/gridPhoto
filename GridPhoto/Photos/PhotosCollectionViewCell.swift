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
         imageThumb.borderImage(radius:5.0)
        // Initialization code
    }
    class func nib() -> UINib {
        return UINib(nibName: "PhotosCollectionViewCell", bundle: nil)
    }
}
