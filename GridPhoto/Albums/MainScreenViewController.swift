//
//  MainScreenViewController.swift
//  GridPhoto
//
//  Created by andyptra on 5/20/20.
//  Copyright © 2020 andyptra. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {
    var page = 1
     var data : [Result] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        getListData()
        // Do any additional setup after loading the view.
    }
    
    
    func getListData() {
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            GetData.shared.getListData(page: self.page){ result, error in
                if error != nil {
                    
                }else{
                    
                    guard let data = result else { return }
                    
                    do {
                        
                        let dataObject = try JSONDecoder().decode(Album.self, from: data)
                        
                        if let data = dataObject.result{
                            self.data.append(contentsOf: data)
                        }
                        DispatchQueue.main.async{
//                            print(self.data)
                            print("https://picsum.photos/300/200?random=2")
                        }
                        
                        
                    }catch{
                        print(error)
                    }
                }
            }
        }
        
    }
    
}
