//
//  API.swift
//  RickAndMortyApp
//
//  Created by Blessy Elizabeth Saini on 25/04/2022.
//

import Foundation

class API {
    static let shared = API()
    
    func getCharacterList(completion: @escaping([Result])->Void) {
        
        let characterURL = Constants.URLs.urlForCharactersList()
        let resource = Resource<CharacterResponse>(url: characterURL) { data in
           return try? JSONDecoder().decode(CharacterResponse.self, from: data)
        }
        Webservice().load(resource: resource) { response in
            if let results = response?.results {
                completion(results)
            }
        }
    }
}
