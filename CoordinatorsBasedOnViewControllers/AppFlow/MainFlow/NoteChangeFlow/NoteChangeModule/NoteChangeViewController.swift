//
//  NoteChangeViewController.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

import Foundation

final class NoteChangeViewController: BaseViewController<NoteChangeView>, NoteChangeModule {

  var onNoteSaved: Completion?

  var noteService: NoteService!

  override func setupView() {
    title = "Note"
    navigationItem.rightBarButtonItem = .init(
      title: "Save",
      style: .plain,
      target: self,
      action: #selector(save)
    )
    rootView.noteTextView.text = noteService.note
  }

  @objc
  private func save() {
    noteService.save(note: rootView.noteTextView.text)
    onNoteSaved?()
  }
}
