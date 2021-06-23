//
//  UIViewController+NavigationItem.swift
//  ChromecastStreamer
//
//  Created by Dulat Bulat on 27.04.2021.
//

import UIKit

public extension UIViewController {

  func addToRight(barButton: UIBarButtonItem) {
    navigationItem.rightBarButtonItems = (navigationItem.rightBarButtonItems ?? []) + [barButton]
  }
}
