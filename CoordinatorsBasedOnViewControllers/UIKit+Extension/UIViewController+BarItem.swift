import UIKit

extension UIViewController {

  private enum AssociatedKeys {
    static var searchActionKey = "bar_action_key"
  }

  private var itemPressed: Completion! {
    get {
      return objc_getAssociatedObject(self, &AssociatedKeys.searchActionKey) as? Completion
    }
    set {
      objc_setAssociatedObject(self, &AssociatedKeys.searchActionKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }

  func addBarItemToNavigationBar(title: String, action: @escaping Completion) {
    let barButton = UIBarButtonItem(
      title: title,
      style: .plain,
      target: self,
      action: #selector(pressed(sender:))
    )
    addToRight(barButton: barButton)
    self.itemPressed = action
  }

  @objc private func pressed(sender: UIBarButtonItem) {
    itemPressed()
  }
}
