//
//  ListMediaNavigator.swift
//  Enagram
//
//  Created by Perso on 18/07/2020.
//  Copyright © 2020 Antoine Subra. All rights reserved.
//

import UIKit

protocol ListMediaNavigable {
  func showDetail(identifier: String, loader: ImageLoader)
}

class ListMediaNavigator {
  weak var viewController: UIViewController?
  
  required init(viewController: UIViewController) {
    self.viewController = viewController
  }
}

extension ListMediaNavigator: ListMediaNavigable {
  func showDetail(identifier: String, loader: ImageLoader) {
    let controller = MediaDetailViewController()
    let mediaDetail = MediaDetailConfigurator()
    mediaDetail.configure(viewController: controller, loader: loader, identifier: identifier)
    viewController?.show(controller, sender: self)
  }
}
