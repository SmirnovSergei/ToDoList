//
//  Task.swift
//  ToDoList
//
//  Created by Сергей Смирнов on 14.04.2026.
//

import Foundation

struct Task {
	var id: Int
	var title: String?
	var description: String
	var date: Date?
	var completed: Bool
	var userId: Int
}
