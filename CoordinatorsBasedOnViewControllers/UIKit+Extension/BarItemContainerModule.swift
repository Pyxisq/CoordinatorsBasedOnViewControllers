import UIKit

protocol BarItemContainerModule {

  func addBarItem(title: String, onTap: @escaping Completion)
}

extension BarItemContainerModule where Self: UIViewController {

  func addBarItem(title: String, onTap: @escaping Completion) {
    addBarItemToNavigationBar(title: title, action: onTap)
  }
}
