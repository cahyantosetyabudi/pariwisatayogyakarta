//
//  TourismPlace.swift
//  PariwasataYogyakarta
//
//  Created by Cahyanto Setya Budi on 12/26/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import Foundation

struct Result: Codable {
    let result: String
    let data: [TourismPlace]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        result = try container.decode(String.self, forKey: .result)
        data = try container.decode([TourismPlace].self, forKey: .data)
    }
    
    enum CodingKeys: String, CodingKey {
        case result
        case data
    }
}
struct TourismPlace: Codable {
    let namaPariwisata: String
    let alamatPariwisata: String
    let detailPariwisata: String
    let gambarPariwisata: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        namaPariwisata = try container.decode(String.self, forKey: .namaPariwisata)
        alamatPariwisata = try container.decode(String.self, forKey: .alamatPariwisata)
        detailPariwisata = try container.decode(String.self, forKey: .detailPariwisata)
        gambarPariwisata = try container.decode(String.self, forKey: .gambarPariwisata)
    }
    
    enum CodingKeys: String, CodingKey {
        case namaPariwisata = "nama_pariwisata"
        case alamatPariwisata = "alamat_pariwisata"
        case detailPariwisata = "detail_pariwisata"
        case gambarPariwisata = "gambar_pariwisata"
    }
}
