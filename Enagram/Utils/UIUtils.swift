//
//  UIUtils.swift
//  Enagram
//
//  Created by Perso on 21/07/2020.
//  Copyright © 2020 Antoine Subra. All rights reserved.
//

import UIKit

precedencegroup ChoicePrecedence {
  associativity: none
  higherThan: BitwiseShiftPrecedence
}

infix operator .. : ChoicePrecedence

public func .. <T>(lhs: T, rhs: T) -> T {
  return UIUtils.isPad ? rhs : lhs
}

open class UIUtils {
  public static var isPhone: Bool {
    return UIDevice.current.userInterfaceIdiom == .phone
  }

  public static var isPad: Bool {
    return UIDevice.current.userInterfaceIdiom == .pad
  }
}

