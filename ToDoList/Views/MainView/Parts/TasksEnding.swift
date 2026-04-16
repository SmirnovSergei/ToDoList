//
//  TasksEnding.swift
//  ToDoList
//
//  Created by Сергей Смирнов on 16.04.2026.
//

import Foundation

enum TasksEnding {
	case one
	case few
	case many
	
	var value: String {
		switch self {
		case .one:
			return "задача"
		case .few:
			return "задачи"
		case .many:
			return "задач"
		}
	}
	
	static func from(_ number: Int) -> TasksEnding {
		let num = number % 100
		let lastNum = number % 10
		
		if num >= 11 && num <= 14 {
			return .many
		}
		
		switch lastNum {
		case 1:
			return .one
		case 2...4:
			return .few
		default:
			return .many
		}
	}
}
