//
//  Presentable+MostPresented.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

import UIKit

extension Presentable {

  var mostTopPresented: UIViewController? {
    var presented = toPresent()
    while let last = presented?.presentedViewController {
      presented = last
    }
    return presented
  }
}
