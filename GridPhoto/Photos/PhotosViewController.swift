//
//  PhotosViewController.swift
//  GridPhoto
//
//  Created by andyptra on 5/20/20.
//  Copyright © 2020 andyptra. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    var page = 1
    @IBOutlet weak var collectionView: UICollectionView!
    private let spacing:CGFloat = 16.0
    var dataImage: DummyData = DummyData()
    var data : [ResultPhoto] = []
    let refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Photos";
        self.setupView()
        setupRefreshControl()
    }
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        if !Connectivity.isConnectedToInternet {
                  let refreshAlert = UIAlertController(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", preferredStyle: UIAlertController.Style.alert)
                             refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                             }))
                             present(refreshAlert, animated: true, completion: nil)
              }
        self.refresh()
   
    }
}


extension PhotosViewController {
    func getListData() {
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            GetData.shared.getListPhoto(page: self.page){ result, error in
                if error != nil {
                }else{
                    guard let data = result else { return }
                    do {
                        let dataObject = try JSONDecoder().decode(Photo.self, from: data)
                        
                        if let data = dataObject.result{
                            self.data.append(contentsOf: data)
                        }
                        DispatchQueue.main.async{
                            self.collectionView.reloadData()
                            self.refreshControl.endRefreshing()
                        }
                    }catch{
                        print(error)
                    }
                }
            }
        }
        
    }
    func setupRefreshControl(){
        self.refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        self.collectionView.addSubview(refreshControl)
    }
    @objc func refresh() {
        self.page = 1
        self.data.removeAll()
        self.collectionView.reloadData()
        self.getListData()
    }
    @objc func tapSelector(sender: CustomTapGestureRecognizer) {
        
        let refreshAlert = UIAlertController(title: "Images", message: "\(sender.Message!)", preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            
        }))
        present(refreshAlert, animated: true, completion: nil)
        
    }
}

extension PhotosViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! PhotosCollectionViewCell
        let random  = Int.random(in: 1..<26)
        let tap = CustomTapGestureRecognizer(target: self, action: #selector(tapSelector(sender:)))
        if let url = URL(string: (dataImage.results[random]) as! String) {
            cell.imageThumb.sd_setImage(with: url, completed: nil)
        }
        cell.lblTitle.text = data[indexPath.row].title
        cell.imageThumb.isUserInteractionEnabled = true
        tap.Message = "\(data[indexPath.row].title)"
        cell.imageThumb.addGestureRecognizer(tap)
        return cell
    }
    
    func setupView(){
        self.collectionView.register(PhotosCollectionViewCell.nib(), forCellWithReuseIdentifier: "cell")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.reloadData()
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        self.collectionView?.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if data.count == 20 * page {
            let lastElement = data.count - 1
            if lastElement == indexPath.row {
                self.page += 1
                self.getListData()
            }
        }
    }
}

extension PhotosViewController :  UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow:CGFloat = 3
        let spacingBetweenCells:CGFloat = 16
        
        let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
        
        if let collection = self.collectionView{
            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
            return CGSize(width: width, height: width)
        }else{
            return CGSize(width: 0, height: 0)
        }
    }
}

class CustomTapGestureRecognizer: UITapGestureRecognizer {
    var Message : String?
}

