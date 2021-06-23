//
//  BaseView.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

import UIKit

class BaseView: UIView {

  override init(frame: CGRect) {
    super.init(frame: frame)
    assemble()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupInitialLayout() {}

  func configureViews() {}

  func assemble() {
    setupInitialLayout()
    configureViews()
  }
}
