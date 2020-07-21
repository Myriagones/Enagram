//
//  MediaDetailProtocol.swift
//  Enagram
//
//  Created by Perso on 20/07/2020.
//  Copyright © 2020 Antoine Subra. All rights reserved.
//

import Foundation

protocol MediaDetailPresenterInput {
  func viewDidLoad()
}

protocol MediaDetailPresenterOutput {
  func display(media: MediaModelView, index: Int, max: Int)
}
