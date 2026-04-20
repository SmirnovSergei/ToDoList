//
//  FakeData.swift
//  ToDoList
//
//  Created by Сергей Смирнов on 20.04.2026.
//

import Foundation

struct FakeData {
	static let tasks: [Task] = [
		Task(id: 1, title: "First task title", description: "Do something nice for someone you care about", date: .now, completed: false, userId: 152),
		Task(id: 2, title: "Second task title", description: "Memorize a poem", date: .now, completed: true, userId: 13),
		Task(id: 3, title: "Third task title", description: "Watch a classic movie", date: .now, completed: true, userId: 68),
		Task(id: 4, title: "Fourth task title", description: "Watch a documentary", date: .now, completed: false, userId: 84)
	]
}
