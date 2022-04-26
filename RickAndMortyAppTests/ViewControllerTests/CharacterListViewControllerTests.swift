//
//  CharacterListViewControllerTests.swift
//  RickAndMortyAppTests
//
//  Created by Blessy Elizabeth Saini on 26/04/2022.
//

import XCTest
@testable import RickAndMortyApp
class CharacterListViewControllerTests: XCTestCase {

    private var characterListVC = CharactersListViewController()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_NumberOfRowsInTableView_Returns_ShouldBeEqualTo_NumberOfCharactersAvailable() {
        
      if  let tableView =  characterListVC.tableView
        {  let noOfRows = characterListVC.tableView(tableView, numberOfRowsInSection: 0)
        let noOfCharactersInList = characterListVC.viewData?.count
        XCTAssertEqual(noOfRows, noOfCharactersInList,"The number of rows in the tableView should be equal to number of available Characters")
      }
    }
    func test_SelectedSearchItem_FromTableView_ToSearchBarText() {
        
         
        characterListVC.searchedViewData = [CharacterTableViewCellModel(id: 1, name: "Rick Sanchez", value: "2", imageURL: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")]
            
        if let searchBar = characterListVC.searchBar {
        characterListVC.searchBar(searchBar, textDidChange: "R")
       
        if let tableView = characterListVC.tableView {
            characterListVC.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        }
        
            
            let expectedSearchBarText = "Rick Sanchez"
            let actualSearchBarText = characterListVC.searchBar.text
            XCTAssertEqual(expectedSearchBarText, actualSearchBarText)
        }
        }
}
