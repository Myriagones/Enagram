//
//  Date+String.swift
//  Enagram
//
//  Created by Perso on 21/07/2020.
//  Copyright © 2020 Antoine Subra. All rights reserved.
//

import Foundation

extension Date {
  var readable: String? {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter.string(from: self)
  }
}
