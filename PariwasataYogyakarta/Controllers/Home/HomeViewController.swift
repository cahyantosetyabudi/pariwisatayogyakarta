//
//  HomeViewController.swift
//  PariwasataYogyakarta
//
//  Created by Cahyanto Setya Budi on 12/26/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeTableView: UITableView!
    
    var tourismPlaceListViewModel: TourismPlaceListViewModel!
    var apiManager = APIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Config navigation controller
        let titleAttribut = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 143/255, green: 196/255, blue: 230/255, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = titleAttribut
        
        //Load tourism places data
        tourismPlaceListViewModel = TourismPlaceListViewModel(apiManager: apiManager, completion: {
            DispatchQueue.main.async {
                self.homeTableView.reloadData()
            }
        })
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = Bundle.main.loadNibNamed("HeaderTableViewCell", owner: self, options: nil)?.first as! HeaderTableViewCell
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tourismPlaceListViewModel.tourismPlaceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        cell.selectionStyle = .none
        
        cell.namePlaceLabel.text = tourismPlaceListViewModel.tourismPlaceList[indexPath.row].namaPariwisata
        cell.addressPlaceLabel.text = tourismPlaceListViewModel.tourismPlaceList[indexPath.row].alamatPariwisata
        self.downloadImage(tourismPlaceListViewModel.tourismPlaceList[indexPath.row].gambarPariwisata, cell)
        
        return cell
    }
    
    func downloadImage(_ url: String, _ cell: HomeTableViewCell?) {
        let task = URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                cell!.placeImageView.image = UIImage(data: data)
            }
            
        }
        task.resume()
    }
}
