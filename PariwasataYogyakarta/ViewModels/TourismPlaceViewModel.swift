//
//  TourismPlaceViewModels.swift
//  PariwasataYogyakarta
//
//  Created by Cahyanto Setya Budi on 12/27/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import Foundation

struct TourismPlaceViewModel {
    var namaPariwisata: String
    var alamatPariwisata: String
    var detailPariwisata: String
    var gambarPariwisata: String
}

extension TourismPlaceViewModel {
    init(tourismPlace: TourismPlace) {
        self.namaPariwisata = tourismPlace.namaPariwisata
        self.alamatPariwisata = tourismPlace.alamatPariwisata
        self.detailPariwisata = tourismPlace.detailPariwisata
        self.gambarPariwisata = tourismPlace.gambarPariwisata
    }
}
