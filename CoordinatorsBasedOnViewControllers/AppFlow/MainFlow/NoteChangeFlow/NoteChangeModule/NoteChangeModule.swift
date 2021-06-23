//
//  NoteChangeModule.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

protocol NoteChangeModule: Presentable {

  var onNoteSaved: Completion? { get set }
}
