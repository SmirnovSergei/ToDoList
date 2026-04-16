//
//  MainView.swift
//  ToDoList
//
//  Created by Сергей Смирнов on 13.04.2026.
//

import SwiftUI

struct MainView: View {
	@State private var searchText = ""
	
	var tasks: [Task] = [Task(id: 1, title: "First task title", description: "Do something nice for someone you care about", date: .now, completed: false, userId: 152),
						 Task(id: 2, title: "Second task title", description: "Memorize a poem", completed: true, userId: 13),
						 Task(id: 3, title: "Third task title", description: "Watch a classic movie", completed: true, userId: 68),
						 Task(id: 4, title: "Fourth task title", description: "Watch a documentary", completed: false, userId: 84)
	]
	
	var body: some View {
		ZStack(alignment: .bottom) {
			VStack() {
				HStack {
					Text("Задачи")
						.font(.system(size: 34, weight: .bold, design: .rounded))
						.foregroundStyle(.appWhite)
					Spacer()
				}
				.padding()
				
				SearchBar(text: $searchText)
				
				List(filteredTasks, id: \.id) { task in
					VStack {
						TaskCellView(task: task)
							.contextMenu {
								Button {
									// FIXME: - Прокинуть навигацию на дитейлс вью
								} label: {
									Label("Редактировать", systemImage: "square.and.pencil")
								}
								
								Divider()
								
								Button {
									// FIXME: - Отсылка к активити вью
								} label: {
									Label("Поделиться", systemImage: "square.and.arrow.up")
								}
								
								Divider()
								
								Button(role: .destructive) {
									// FIXME: - Создать менеджер с методом удаления таски
								} label: {
									Label("Удалить", systemImage: "trash")
								}
							}
						
					}
					.listRowBackground(Color.clear)
					.listRowSeparatorTint(.appStroke)
				}
				.listStyle(.plain)
			}
			.padding(.horizontal, 10)
			.background(.appBlack)
			
			ZStack {
				Text("\(tasks.count) \(TasksEnding.from(tasks.count).value)")
					.foregroundStyle(.appWhite)
				
				HStack {
					Spacer()
					
					Button {
						// FIXME: - Create new task method
					} label: {
						Image(systemName: "square.and.pencil")
							.resizable()
							.frame(width: 24, height: 24)
							.foregroundStyle(.appYellow)
					}
				}
			}
			.padding(.horizontal, 25)
			.frame(height: 63)
			.background(.appGray)
		}
	}
}

extension MainView {
	private var filteredTasks: [Task] {
		if searchText.isEmpty {
			return tasks
		} else {
			return tasks.filter {
				($0.title?.localizedCaseInsensitiveContains(searchText) ?? false) ||
				$0.description.localizedCaseInsensitiveContains(searchText)
			}
		}
	}
}

#Preview {
	MainView()
}
