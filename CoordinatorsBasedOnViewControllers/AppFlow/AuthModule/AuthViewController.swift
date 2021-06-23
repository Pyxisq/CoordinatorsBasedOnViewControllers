//
//  AuthViewController.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

import Foundation

final class AuthViewController: BaseViewController<AuthView>, AuthModule {

  var onLogin: Completion?

  override func setupView() {
    validate()
  }

  override func bindView() {
    rootView.submitButton.addTarget(self, action: #selector(submit), for: .touchUpInside)
    rootView.loginTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
    rootView.passwordTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
  }

  @objc
  private func textChanged() {
    validate()
  }

  @objc
  private func submit() {
    onLogin?()
  }

  private func validate() {
    let login = rootView.loginTextField.text ?? ""
    let password = rootView.passwordTextField.text ?? ""

    let isValid = login.count >= 5 && password.count >= 8

    rootView.submitButton.isEnabled = isValid
  }
}
