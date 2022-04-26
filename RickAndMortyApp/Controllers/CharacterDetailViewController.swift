//
//  CharacterDetailViewController.swift
//  RickAndMortyApp
//
//  Created by Blessy Elizabeth Saini on 26/04/2022.
//

import UIKit

class CharacterDetailViewController: UIViewController,CoordinatorBoard {
    
    //MARK: - IBOutlets
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var currentLocationLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var charaterImageView: UIImageView!

    //MARK: - Properties
    var result: Result?
    var viewModel = CharacterDetailViewModel()
    
    //MARK: - View Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.largeTitleDisplayMode = .never
        let viewData = viewModel.getViewData(data: result)
        self.statusLabel.text = viewData?.status
        self.currentLocationLabel.text = viewData?.currentLocation
        self.speciesLabel.text = viewData?.species
        self.genderLabel.text = viewData?.gender
        self.nameLabel.text = viewData?.name
        self.charaterImageView.downloaded(from: viewData?.charaterURL ?? "")
       
    }

}
