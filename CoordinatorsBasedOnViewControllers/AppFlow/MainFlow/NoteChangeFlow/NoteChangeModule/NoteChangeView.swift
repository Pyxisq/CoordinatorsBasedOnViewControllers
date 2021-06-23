//
//  NoteChangeView.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

import UIKit

final class NoteChangeView: BaseView {

  let noteTextView = UITextView()

  override func setupInitialLayout() {
    addSubview(noteTextView)
    noteTextView.setEqualEdges(to: self, constant: 16)
  }

  override func configureViews() {
    backgroundColor = .white
  }
}
