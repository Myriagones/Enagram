//
//  ListMediaConfigurator.swift
//  Enagram
//
//  Created by Perso on 18/07/2020.
//  Copyright © 2020 Antoine Subra. All rights reserved.
//

import Foundation

protocol ListMediaConfigurable {
  func configure(viewController: ListMediaViewController)
}

class ListMediaConfigurator: ListMediaConfigurable {
  func configure(viewController: ListMediaViewController) {
    let router = ListMediaNavigator(viewController: viewController)
    let presenter = ListMediaPresenter(output: viewController, router: router)
    viewController.presenter = presenter
  }
}
