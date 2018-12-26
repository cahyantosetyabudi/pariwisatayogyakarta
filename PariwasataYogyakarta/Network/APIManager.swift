//
//  APIManager.swift
//  PariwasataYogyakarta
//
//  Created by Cahyanto Setya Budi on 12/27/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import Foundation

class APIManager {
    func getTourismPlaces(completion: @escaping ([TourismPlace]) -> Void) {
        var tourismList = [TourismPlace]()
        let session = URLSession.shared
        let url = URL(string: "http://erporate.com/bootcamp/jsonBootcamp.php")
        let task = session.dataTask(with: url!) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let json = try decoder.decode(Result.self, from: data)
                tourismList = json.data
                completion(tourismList)
            } catch let err {
                print(err.localizedDescription)
                print(err)
            }
        }
        task.resume()
    }
}
