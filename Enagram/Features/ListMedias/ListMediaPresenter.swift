//
//  ListMediaPresenter.swift
//  Enagram
//
//  Created by Perso on 18/07/2020.
//  Copyright © 2020 Antoine Subra. All rights reserved.
//

import Foundation

class ListMediaPresenter {
  private var router: ListMediaNavigable!
  private var output: ListMediaPresenterOutput!
  private var data: [MediaCaptionModelView]?
  private var imageLoader = ImageLoader()
  
  init(output: ListMediaPresenterOutput, router: ListMediaNavigable) {
    self.output = output
    self.router = router
  }
}

extension ListMediaPresenter: ListMediaPresenterInput {
  func viewDidLoad() {
    ListMediaManager.getMedias(completion: { (medias) in
      self.data = medias
      self.output.reloadData()
    }, error: {
      print("ListMediaManager technical error")
    })
  }
  
  func numberOfRow() -> Int {
    return data?.count ?? 0
  }
  
  func showMedias(cell: MediaCellDelegate, index: IndexPath) {
    if let media = data?[index.row] {
      cell.show(media: media, loader: imageLoader)
    }
  }
}
