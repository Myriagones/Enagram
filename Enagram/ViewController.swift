//
//  ViewController.swift
//  Enagram
//
//  Created by Antoine Subra on 18/07/2020.
//  Copyright © 2020 Antoine Subra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    MediasClient.getMedias(completion: { (media) in
      print(media.data.count)
    }) {
      print("error medias")
    }
    
    MediaClient.getMedia(id: "17864185120145624", completion: { (media) in
      print(media.media_url)
    }) {
      print("error media")
    }
    
    MediaChildrenClient.getMediaChildren(id: "17880028738697994", completion: { (medias) in
      print(medias.data.count)
    }) {
      print("error children")
    }
  }


}

