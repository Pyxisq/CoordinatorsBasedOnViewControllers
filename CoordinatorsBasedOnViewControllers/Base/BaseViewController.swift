//
//  BaseViewController.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

import UIKit

class BaseViewController<RootView: UIView>: UIViewController {

  var rootView: RootView {
    view as! RootView
  }

  override func loadView() {
    view = RootView()
  }

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setupTabItem()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    bindView()
    setupView()
  }

  func setupTabItem() {}

  func setupView() {}

  func bindView() {}
}
