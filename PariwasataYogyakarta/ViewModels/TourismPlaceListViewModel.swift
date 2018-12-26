//
//  TourismPlaceListViewModel.swift
//  PariwasataYogyakarta
//
//  Created by Cahyanto Setya Budi on 12/27/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import Foundation

class TourismPlaceListViewModel {
    var tourismPlaceList = [TourismPlaceViewModel]()
    
    init(apiManager: APIManager, completion: @escaping () -> Void) {
        apiManager.getTourismPlaces { (tourismPlaceList) in
            self.tourismPlaceList = tourismPlaceList.map(TourismPlaceViewModel.init)
            completion()
        }
    }
}

