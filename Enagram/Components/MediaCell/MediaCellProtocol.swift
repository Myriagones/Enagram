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
  func onReuse(token: UUID?)
}

protocol MediaCellPresenterOutput {
  func showImage(image: UIImage, index: Int)
  func setupReuse(token: UUID?)
}
