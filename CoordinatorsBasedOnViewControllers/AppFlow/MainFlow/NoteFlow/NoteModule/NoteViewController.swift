//
//  NoteViewController.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

final class NoteViewController: BaseViewController<NoteView>, NoteModule {

  var noteService: NoteService!

  override func setupTabItem() {
    let image = Images.home.image
    tabBarItem = .init(title: "Note", image: image, selectedImage: image)
  }

  override func setupView() {
    title = "Note"
    rootView.set(note: noteService.note)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    noteService.add(listener: self)
  }
}

extension NoteViewController: NoteListener {

  func update(note: String?) {
    rootView.set(note: noteService.note)
  }
}
