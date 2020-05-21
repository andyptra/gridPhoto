//
//  AlbumsTableViewCell.swift
//  GridPhoto
//
//  Created by andyptra on 5/20/20.
//  Copyright © 2020 andyptra. All rights reserved.
//

import UIKit

class AlbumsTableViewCell: UITableViewCell {
    @IBOutlet weak var imageThumb: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        imageThumb.borderImage(radius:5.0)
        // Configure the view for the selected state
    }
    class func nib() -> UINib {
        return UINib(nibName: "AlbumsTableViewCell", bundle: nil)
    }
}

