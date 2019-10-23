//
//  ApiManager.swift
//  desafio-xp
//
//  Created by Nadilson Santana on 19/10/19.
//  Copyright © 2019 Nadilson Santana. All rights reserved.
//

import Foundation
import Alamofire

class ApiManager {
    
    private let publicKey = "19f975076b6d07b57f26055b3a1532d8"
    private let privateKey = "629307f519483a651c079508f8530e89916614c7"
    private let ts = NSDate().timeIntervalSince1970.description

    func getcharacters(completion: @escaping ([Heroes]?,Bool) -> Void) {

        let params: Parameters = [
            "apikey": publicKey,
            "ts": ts,
            "hash": (ts + privateKey + publicKey).md5()
        ]
        
        Alamofire.request("https://gateway.marvel.com:443/v1/public/characters",parameters: params).responseJSON { response in
            if let JSON = response.result.value {
                print("json: \(JSON)")
                let result = try? JSONDecoder().decode(Character.self, from: response.data!)
                completion(result?.data?.heroes, true)
            } else {
                completion(nil, false)
            }
        }
    }
    
    func getImage(urlString: String, completion: @escaping (ItemInformation?, Bool)-> Void) {
                
        let params: Parameters = [
            "apikey": publicKey,
            "ts": ts,
            "hash": (ts + privateKey + publicKey).md5()
        ]
        
        Alamofire.request(urlString, parameters: params).responseJSON { response in
            if let JSON = response.result.value {
                print("json: \(JSON)")
                let result = try? JSONDecoder().decode(ItemInformation.self, from: response.data!)
                completion(result, true)
            } else {
                completion(nil,false)
            }
        }
    }
}
