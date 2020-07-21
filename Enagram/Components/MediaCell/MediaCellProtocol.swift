//
//  MediaCellProtocol.swift
//  Enagram
//
//  Created by Perso on 19/07/2020.
//  Copyright © 2020 Antoine Subra. All rights reserved.
//

import UIKit

protocol MediaCellPresenterInput {
  func loadMedia(media: MediaCaptionModelView, loader: ImageLoader)
  func onReuse(tokens: [UUID])
}

protocol MediaCellPresenterOutput {
  func display(media: MediaModelView, index: Int, max: Int)
  func setupReuse(tokens: [UUID])
}
