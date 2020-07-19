//
//  MediaCellConfigurator.swift
//  Enagram
//
//  Created by Perso on 19/07/2020.
//  Copyright © 2020 Antoine Subra. All rights reserved.
//

import Foundation

protocol MediaCellConfigurable {
  func configure(cell: MediaCollectionViewCell)
}

class MediaCellConfigurator: MediaCellConfigurable {
  func configure(cell: MediaCollectionViewCell) {
    let presenter = MediaCellPresenter(output: cell)
    cell.presenter = presenter
  }
}
