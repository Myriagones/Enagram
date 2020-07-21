//
//  MediaDetailPresenter.swift
//  Enagram
//
//  Created by Perso on 20/07/2020.
//  Copyright © 2020 Antoine Subra. All rights reserved.
//

import Foundation

class MediaDetailPresenter {
  private var output: MediaDetailPresenterOutput!
  private var identifier: String
  private var loader: ImageLoader
  
  init(output: MediaDetailPresenterOutput, loader: ImageLoader, identifier: String) {
    self.output = output
    self.identifier = identifier
    self.loader = loader
  }
  
  func loadImages(medias: [MediaModelView]) {
    for index in 0 ..< medias.count {
      
      let media = medias[index]
      guard let url = media.url else {
        return
      }
      
      let _ = loader.loadImage(url) { result in
        do {
          let image = try result.get()
          media.image = image
          DispatchQueue.main.async {
            self.output.display(media: media, index: index, max: medias.count)
          }
        } catch {
          print(error)
        }
      }
    }
  }
}

extension MediaDetailPresenter: MediaDetailPresenterInput {
  func viewDidLoad() {
    MediaManager.getImages(identifier: identifier, completion: { (medias) in
      self.loadImages(medias: medias)
    }, error: {
      print("image not loaded")
    })
  }
}
