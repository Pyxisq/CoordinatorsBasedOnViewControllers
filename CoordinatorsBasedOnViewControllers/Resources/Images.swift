//
//  Images.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

import UIKit

extension Images {

  var image: UIImage? {
    UIImage(named: rawValue)
  }
}

enum Images: String {
  case home
  case settings
}
