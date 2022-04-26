//
//  CharacterListViewModelTests.swift
//  RickAndMortyAppTests
//
//  Created by Blessy Elizabeth Saini on 26/04/2022.
//

import XCTest
@testable import RickAndMortyApp
class CharacterListViewModelTests: XCTestCase {

    
    let characterListVM = CharactersListViewModel()
    override class func setUp() {
        super.setUp()
        
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_RemoveWhiteSpace_Returns_StringAfterTrimmingCharacters() {
        let value = characterListVM.textRemovingWhiteSpace(for: " Rock")
        XCTAssertEqual(value, "Rock")
    }
    
    func test_CharacterListAPIResource_Returns_CharacterListResponse() {
 
        var resultData =  [CharacterTableViewCellModel]()
        let expectation = expectation(description: "CharacterListResponse")
       characterListVM.getCharacterList { result in
           resultData = result
           XCTAssertNotNil(resultData)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10.0, handler: nil)
        
    }

}
