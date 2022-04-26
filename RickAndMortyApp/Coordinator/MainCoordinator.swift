//
//  MainCoordinator.swift
//  RickAndMortyApp
//
//  Created by Blessy Elizabeth Saini on 26/04/2022.
//

import Foundation
import UIKit

class MainCoordinator : Coordinator {

    var navigationController: UINavigationController

    init(with _navigationController : UINavigationController){
        self.navigationController = _navigationController
    }

    func configureRootViewController() {

        let CharactersListVC = CharactersListViewController.instansiateFromStoryBoard()
        CharactersListVC.mainCoordinator = self
        self.navigationController.pushViewController(CharactersListVC, animated: false)
       
    }

    func navigateToCharacterDetailVC(result: Result?) {

        let characterDetailVC = CharacterDetailViewController.instansiateFromStoryBoard()
        characterDetailVC.result = result
        self.navigationController.pushViewController(characterDetailVC, animated: true)
    }
}
