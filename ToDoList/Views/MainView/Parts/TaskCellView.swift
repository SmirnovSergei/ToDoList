//
//  TaskCellView.swift
//  ToDoList
//
//  Created by Сергей Смирнов on 16.04.2026.
//

import SwiftUI

struct TaskCellView: View {
	var task: Task
	
	var body: some View {
		HStack(alignment: .top) {
			Button {
				//
			} label: {
				Image(systemName: task.completed ? "checkmark.circle" : "circle")
					.resizable()
					.frame(width: 24, height: 24)
					.foregroundStyle(task.completed ? .appYellow : .appStroke)
			}
			
			VStack(alignment: .leading) {
				Text(task.title ?? "")
					.font(.system(size: 16, weight: .medium, design: .rounded))
					.foregroundStyle(task.completed ? .gray : .appWhite)
					.strikethrough(task.completed)
				Text(task.description)
					.font(.system(size: 12, weight: .regular, design: .rounded))
					.foregroundStyle(task.completed ? .gray : .appWhite)
			}
			.padding(.horizontal, 8)
		}
	}
}
