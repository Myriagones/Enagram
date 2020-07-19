//
//  ListMediaProtocol.swift
//  Enagram
//
//  Created by Perso on 18/07/2020.
//  Copyright © 2020 Antoine Subra. All rights reserved.
//

import Foundation

protocol ListMediaPresenterOutput {
  func reloadData()
}

protocol ListMediaPresenterInput {
  func viewDidLoad()
  func numberOfRow() -> Int
  func showMedias(cell: MediaCellDelegate, index: IndexPath)
}
