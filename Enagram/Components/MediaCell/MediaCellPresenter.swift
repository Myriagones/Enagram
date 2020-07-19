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
    var tokens = [UUID]()
    for index in 0 ..< medias.count {
      guard let url = medias[index].url else {
        return
      }
      let token = loader?.loadImage(url, identifier: medias[index].identifier) { result in
        do {
          let image = try result.get()
          DispatchQueue.main.async {
            self.output.showImage(image: image, index: index)
          }
        } catch {
          print(error)
        }
      }
      
      if let token = token {
        tokens.append(token)
      }
      
      
    }
    
    output.setupReuse(tokens: tokens)
    
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
  
  func onReuse(tokens: [UUID]) {
    for token in tokens {
      self.loader?.cancelLoad(token)
    }
  }
}
