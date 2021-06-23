//
//  NoteView.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

import UIKit

final class NoteView: BaseView {

  private let scrollView = UIScrollView()
  private let noteLabel = UILabel()

  override func setupInitialLayout() {
    addSubview(scrollView)
    scrollView.setEqualEdges(to: self)

    scrollView.addSubview(noteLabel)
    noteLabel.setEqualEdges(to: scrollView, constant: 16)
    noteLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32).isActive = true
  }

  override func configureViews() {
    backgroundColor = .white

    noteLabel.numberOfLines = 0
  }
}

extension NoteView {

  func set(note: String?) {
    noteLabel.text = note
  }
}
