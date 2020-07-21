//
//  String+Date.swift
//  Enagram
//
//  Created by Perso on 21/07/2020.
//  Copyright © 2020 Antoine Subra. All rights reserved.
//

import Foundation

extension String {
  var toDate: Date? {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXXXX"
    return formatter.date(from: self)
  }
}
