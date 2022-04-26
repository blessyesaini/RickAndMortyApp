//
//  Constants.swift
//  RickAndMortyApp
//
//  Created by Blessy Elizabeth Saini on 25/04/2022.
//

import Foundation

struct Constants {
    static let baseURL = "https://rickandmortyapi.com/api"
    struct URLs {
     static func urlForCharactersList() -> URL {
         return URL(string: "\(baseURL)/character")!
        }
    }
}
