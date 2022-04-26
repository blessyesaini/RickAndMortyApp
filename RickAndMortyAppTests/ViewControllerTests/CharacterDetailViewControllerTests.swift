//
//  CharacterDetailViewControllerTests.swift
//  RickAndMortyAppTests
//
//  Created by Blessy Elizabeth Saini on 27/04/2022.
//

import XCTest
@testable import RickAndMortyApp
class CharacterDetailViewControllerTests: XCTestCase {

    private var characterListVC = CharacterDetailViewController()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_ViewModel_Is_NotNil() {
        let vm = characterListVC.viewModel
        XCTAssertNotNil(vm)
    }
 
    

}
