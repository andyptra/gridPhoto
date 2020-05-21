//
//  UIViewController+Ext.swift
//  GridPhoto
//
//  Created by andyptra on 5/21/20.
//  Copyright © 2020 andyptra. All rights reserved.
//

import UIKit

extension UIViewController {
    
   func popupAlert(title: String?, message: String?, actionTitles:[String?], actionStyle:[UIAlertAction.Style], actions:[((UIAlertAction) -> Void)?], vc: UIViewController) {
          let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
          for (index, title) in actionTitles.enumerated() {
               let action = UIAlertAction(title: title, style: actionStyle[index], handler: actions[index])
               alert.addAction(action)
          }
          vc.present(alert, animated: true, completion: nil)
     }
}
