//
//  NoteService.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

import Foundation

protocol NoteService {

  var note: String? { get }

  func save(note: String?)
  func add(listener: NoteListener)
}

final class NoteServiceImpl: NoteService {

  private let userDefaults = UserDefaults.standard

  private var listeners: NSHashTable<AnyObject> = NSHashTable.weakObjects()

  private(set) var note: String? {
    get {
      userDefaults.string(forKey: noteKey)
    } set {
      userDefaults.setValue(newValue, forKey: noteKey)
    }
  }

  private var noteKey: String {
    "note_save_key"
  }

  func save(note: String?) {
    self.note = note
    listeners.allObjects.forEach {
      ($0 as? NoteListener)?.update(note: note)
    }
  }

  func add(listener: NoteListener) {
    listeners.add(listener)
  }
}
