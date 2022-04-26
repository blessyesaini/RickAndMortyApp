//
//  CharactersListViewModel.swift
//  RickAndMortyApp
//
//  Created by Blessy Elizabeth Saini on 25/04/2022.
//

import UIKit

class CharactersListViewModel: NSObject {

    var results: [Result]?
    func getCharacterList(completion: @escaping([CharacterTableViewCellModel])->()) {
        var viewData = [CharacterTableViewCellModel]()
        API.shared.getCharacterList { results in
            self.results = results
            for result in results {
                viewData.append(CharacterTableViewCellModel(id: result.id, name: result.name, value: String(result.episode?.count ?? 0), imageURL: result.image))
            }
            print(viewData)
            completion(viewData)
        }
        
    }
    func getCharacterDetail(id: Int?) -> Result? {
        var selectedCharacter : Result?
        if let index =  self.results?.firstIndex(where: { $0.id == id}) {
            selectedCharacter = self.results?[index]
        }
        return selectedCharacter
    }
    func textRemovingWhiteSpace(for text: String) -> String {
        return text.trimmingCharacters(in: .whitespaces)
    }
}
