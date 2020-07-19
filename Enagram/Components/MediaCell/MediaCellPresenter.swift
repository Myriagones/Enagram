//
//  MediaCellPresenter.swift
//  Enagram
//
//  Created by Perso on 19/07/2020.
//  Copyright © 2020 Antoine Subra. All rights reserved.
//

import Foundation

class MediaCellPresenter {
  private var output: MediaCellPresenterOutput!
  private var loader: ImageLoader?
  
  init(output: MediaCellPresenterOutput) {
    self.output = output
  }
  
  func loadImages(medias: [MediaModelView]) {
    for media in medias {
      guard let url = media.url else {
        return
      }
      let token = loader?.loadImage(url) { result in
        do {
          let image = try result.get()
          DispatchQueue.main.async {
            self.output.showImage(image: image, index: 0)
          }
        } catch {
          print(error)
        }
      }
      output.setupReuse(token: token)
    }
    
  }
}

extension MediaCellPresenter: MediaCellPresenterInput {
  func loadMedia(media: MediaCaptionModelView, loader: ImageLoader) {
    MediaManager.getImages(identifier: media.identifier, completion: { (medias) in
      self.loader = loader
      self.loadImages(medias: medias)
    }, error: {
      print("image not loaded")
    })
  }
  
  func onReuse(token: UUID?) {
    if let token = token {
      self.loader?.cancelLoad(token)
    }
  }
}
