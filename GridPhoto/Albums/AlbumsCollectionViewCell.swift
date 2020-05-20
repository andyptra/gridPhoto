//
//  AlbumsCollectionViewCell.swift
//  GridPhoto
//
//  Created by andyptra on 5/20/20.
//  Copyright © 2020 andyptra. All rights reserved.
//

import UIKit

class AlbumsCollectionViewCell: UICollectionViewCell {

     @IBOutlet weak var MainView: UIView!
      @IBOutlet weak var thumbnail: UIImageView!
      @IBOutlet weak var nameLbl: UILabel!
      override func awakeFromNib() {
          super.awakeFromNib()
          // Initialization code
         
      }
      class func nib() -> UINib {
          return UINib(nibName: "AlbumsCollectionViewCell", bundle: nil)
      }
}
