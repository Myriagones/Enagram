//
//  MediaDetailConfigurator.swift
//  Enagram
//
//  Created by Perso on 20/07/2020.
//  Copyright © 2020 Antoine Subra. All rights reserved.
//

import Foundation

protocol MediaDetailConfigurable {
  func configure(viewController: MediaDetailViewController, loader: ImageLoader, identifier: String)
}

class MediaDetailConfigurator: MediaDetailConfigurable {
  func configure(viewController: MediaDetailViewController, loader: ImageLoader, identifier: String) {
    let presenter = MediaDetailPresenter(output: viewController, loader: loader, identifier: identifier)
    viewController.presenter = presenter
  }
}
