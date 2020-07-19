//
//  ListMediaNavigator.swift
//  Enagram
//
//  Created by Perso on 18/07/2020.
//  Copyright © 2020 Antoine Subra. All rights reserved.
//

import UIKit

protocol ListMediaNavigable {
  
}

class ListMediaNavigator {
  weak var viewController: UIViewController?
  
  required init(viewController: UIViewController) {
    self.viewController = viewController
  }
}

extension ListMediaNavigator: ListMediaNavigable {
  
}
