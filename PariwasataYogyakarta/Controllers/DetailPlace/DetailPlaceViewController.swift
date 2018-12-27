//
//  DetailPlaceViewController.swift
//  PariwasataYogyakarta
//
//  Created by Cahyanto Setya Budi on 12/27/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import UIKit
import GoogleMaps

class DetailPlaceViewController: UIViewController {

    @IBOutlet weak var mainPlaceImageView: UIImageView!
    @IBOutlet weak var namePlaceLabel: UILabel!
    @IBOutlet weak var placeAddressLabel: UILabel!
    @IBOutlet weak var placeDescriptionTextiew: UITextView!
    @IBOutlet weak var pinAddressImage: UIImageView!
    @IBOutlet weak var mapView: GMSMapView!
    
    var tourismPlace: TourismPlaceViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Config layout
        pinAddressImage.tintColor = UIColor.darkGray
        
        namePlaceLabel.text = tourismPlace.namaPariwisata
        placeAddressLabel.text = tourismPlace.alamatPariwisata
        placeDescriptionTextiew.text = tourismPlace.detailPariwisata
        downloadImage(tourismPlace.gambarPariwisata)
        
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let map = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView = map
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = map
    }
    
    func downloadImage(_ url: String) {
        let task = URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.mainPlaceImageView.image = UIImage(data: data)
            }
            
        }
        task.resume()
    }
}
