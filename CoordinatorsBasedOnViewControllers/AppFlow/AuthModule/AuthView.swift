//
//  AuthView.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

import UIKit

final class AuthView: BaseView {

  let loginTextField = UITextField()
  let passwordTextField = UITextField()

  let submitButton = UIButton(type: .system)

  override func setupInitialLayout() {
    let contentStackView = UIStackView(
      views: [loginTextField, passwordTextField, submitButton],
      axis: .vertical,
      spacing: 16
    )
    addSubview(contentStackView)
    contentStackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      contentStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
      contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
    ])
  }

  override func configureViews() {
    backgroundColor = .white

    loginTextField.placeholder = "Login"
    passwordTextField.placeholder = "Password"

    submitButton.setTitle("Sign in", for: .normal)
  }
}
