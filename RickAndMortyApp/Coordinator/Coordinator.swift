//
//  Coordinator.swift
//  RickAndMortyApp
//
//  Created by Blessy Elizabeth Saini on 26/04/2022.
//

import Foundation
import UIKit

protocol Coordinator : AnyObject {
    var navigationController: UINavigationController { get set }

    func configureRootViewController()
}
