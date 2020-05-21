//
//  MainScreenViewController.swift
//  GridPhoto
//
//  Created by andyptra on 5/20/20.
//  Copyright © 2020 andyptra. All rights reserved.
//

import UIKit
import SDWebImage
class MainScreenViewController: UIViewController {
    var page = 1
    var dataImage: DummyData = DummyData()
    @IBOutlet weak var tableView: UITableView!
    var data : [Result] = []
    let refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getListData()
        self.setupTableView()
        self.setupRefreshControl()
   
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        if !Connectivity.isConnectedToInternet {
               let refreshAlert = UIAlertController(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", preferredStyle: UIAlertController.Style.alert)
                          refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                          }))
                          present(refreshAlert, animated: true, completion: nil)
           }
        self.refresh()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @objc func refresh() {
        self.page = 1
        self.data.removeAll()
        self.tableView.reloadData()
        self.getListData()
    }
    func setupRefreshControl(){
        self.refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        self.tableView.addSubview(refreshControl)
    }
    
    
}
extension MainScreenViewController {
    func getListData() {
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            GetData.shared.getListAlbum(page: self.page){ result, error in
                if error != nil {
                    
                }else{
                    
                    guard let data = result else { return }
                    
                    do {
                        
                        let dataObject = try JSONDecoder().decode(Album.self, from: data)
                        
                        if let data = dataObject.result{
                            self.data.append(contentsOf: data)
                        }
                        DispatchQueue.main.async{
                            self.tableView.reloadData()
                            self.refreshControl.endRefreshing()
                        }
                        
                        
                    }catch{
                        print(error)
                    }
                }
            }
        }
        
    }
    
}
extension MainScreenViewController :  UITableViewDelegate, UITableViewDataSource {
    func setupTableView(){
        tableView.register(AlbumsTableViewCell.nib(), forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
            return data.count
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if data.count == 20 * page {
            let lastElement = data.count - 1
            if lastElement == indexPath.row {
                self.page += 1
                self.getListData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        selectedOffersIndex = indexPath.row
        let vc = PhotosViewController()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! AlbumsTableViewCell
            let random  = Int.random(in: 1..<26)
            if let url = URL(string: (dataImage.results[random]) as! String) {
                cell.imageThumb.sd_setImage(with: url, placeholderImage: UIImage(named: "default_photo"), completed: nil)
            }
            cell.lblTitle.text = "\(data[indexPath.row].title)"
            cell.selectionStyle = .none
            return cell
    }
}


