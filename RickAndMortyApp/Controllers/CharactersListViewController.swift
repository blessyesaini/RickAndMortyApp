//
//  ViewController.swift
//  RickAndMortyApp
//
//  Created by Blessy Elizabeth Saini on 25/04/2022.
//

import UIKit

enum State {
    case noData
    case populated([CharacterTableViewCellModel])
}

class CharactersListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate,CoordinatorBoard {
    
    
    //MARK: - IBOutlets
    @IBOutlet var noResultsView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //MARK: - Properties
    weak var mainCoordinator : MainCoordinator?
    var viewModel = CharactersListViewModel()
    var viewData: [CharacterTableViewCellModel]?
    var searchedViewData: [CharacterTableViewCellModel]?
    var isSearching = false
    var state = State.noData {
        didSet {
            setView()
        }
    }
    
    //MARK: - Custom Methods
    func prepareTableView() {
        tableView.register(UINib(nibName: "CharacterTableViewCell", bundle: nil), forCellReuseIdentifier: CharacterTableViewCell.reuseIdentifier)
    }
    
    func prepareUI() {
        title = "Characters"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setView() {
        switch state {
        case .noData:
            self.tableView.backgroundView = noResultsView
            
        case .populated(let charactersListData):
            self.tableView.backgroundView = nil
            if isSearching == true  {
            self.searchedViewData =  charactersListData
            }
            else {
                self.viewData = charactersListData
            }
           
        }
        self.tableView.reloadData()
    }
    
    //MARK: - View Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        prepareTableView()
       
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareUI()
        viewModel.getCharacterList { result in
            self.state = .populated(result)
        }
    }
    //MARK: - TableView Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        isSearching == true ? searchedViewData?.count ?? 0 : viewData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.reuseIdentifier, for: indexPath) as! CharacterTableViewCell
        cell.data = isSearching == true ? searchedViewData?[indexPath.row] : viewData?[indexPath.row]
        return cell
    }
    //MARK: - TableView Delegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = isSearching == true ? searchedViewData?[indexPath.row].id : viewData?[indexPath.row].id
        let data = viewModel.getCharacterDetail(id: id)
        mainCoordinator?.navigateToCharacterDetailVC(result: data)
        searchBar.text = ""
    }
    //MARK: - Search Bar delegate Methods
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let viewData = viewData {
        let searchValue = viewModel.textRemovingWhiteSpace(for: searchText.lowercased())
            searchedViewData =  viewData.filter({$0.name?.lowercased().contains(searchValue) == true})
        }
        isSearching = true
        if let searchedViewData = searchedViewData {
            self.state = searchedViewData.count == 0 ? .noData: .populated(searchedViewData)
        }
        
      }
      
      func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
          isSearching = false
          searchBar.text = ""
          if let viewData = viewData {
              self.state = .populated(viewData)
          }
          
      }
}

