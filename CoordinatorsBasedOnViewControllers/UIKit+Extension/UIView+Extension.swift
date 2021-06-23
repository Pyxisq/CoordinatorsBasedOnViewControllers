//
//  UIView+Extension.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

import UIKit

extension UIView {

  func setEqualEdges(to view: UIView, constant: CGFloat = 0) {
    translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      topAnchor.constraint(equalTo: view.topAnchor, constant: constant),
      leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant),
      trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constant),
      bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constant)
    ])
  }
}
