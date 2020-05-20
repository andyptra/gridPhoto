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
        setupUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupUI() {
        
        imageThumb.layer.cornerRadius = 5.0
        imageThumb.clipsToBounds = true
        imageThumb.contentMode = .scaleAspectFill
        imageThumb.translatesAutoresizingMaskIntoConstraints = false
    }
    class func nib() -> UINib {
        return UINib(nibName: "AlbumsTableViewCell", bundle: nil)
    }
}

