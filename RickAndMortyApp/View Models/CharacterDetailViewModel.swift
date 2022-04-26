//
//  CharacterDetailViewModel.swift
//  RickAndMortyApp
//
//  Created by Blessy Elizabeth Saini on 26/04/2022.
//

import UIKit

struct CharacterDetailDisplayViewModel {
    let status: String?
    let currentLocation: String?
    let species: String?
    let gender: String?
    let name: String?
    let charaterURL: String?
}

class CharacterDetailViewModel: NSObject {
    
    func getViewData(data: Result?) -> CharacterDetailDisplayViewModel? {
        return CharacterDetailDisplayViewModel(status: data?.status?.rawValue, currentLocation: data?.location?.name, species: data?.species?.rawValue, gender: data?.gender?.rawValue, name: data?.name, charaterURL: data?.image)
    }
}
