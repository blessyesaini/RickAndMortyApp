//
//  CharacterDetailViewModelTests.swift
//  RickAndMortyAppTests
//
//  Created by Blessy Elizabeth Saini on 26/04/2022.
//

import XCTest
@testable import RickAndMortyApp
class CharacterDetailViewModelTests: XCTestCase {

    let characterDetailtVM = CharacterDetailViewModel()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_GetCharacterDetail() throws {
        guard let path = Bundle(for: CharacterDetailViewModelTests.self).path(forResource: "characterListResponse", ofType: "json")
                   else { fatalError("Can't find .json file") }

               let data = try Data(contentsOf: URL(fileURLWithPath: path))
               let response = try JSONDecoder().decode(CharacterResponse.self, from: data)
        if let results = response.results, let result = results.first {
           
            let result = Result(id: result.id, name: result.name, status: result.status, species: result.species, gender: result.gender, location: result.location, image: result.image, episode: result.episode, url: result.url, created: result.created)
           let testData =  characterDetailtVM.getViewData(data: result)
            let name = testData?.name ?? ""
            XCTAssertEqual(name, result.name)
        }
      
    }
  

}

class MockResult {
    
}
