//
//  MainView.swift
//  ToDoList
//
//  Created by Сергей Смирнов on 13.04.2026.
//

import SwiftUI

struct MainView: View {
	@State private var tasks = FakeData.tasks
	@State private var searchText = ""
	@State private var selectedTask: Task?
	@State private var isSharePresented = false
	
	var body: some View {
		NavigationStack {
			ZStack(alignment: .bottom) {
				if selectedTask != nil {
					Color.black.opacity(0.2)
						.ignoresSafeArea()
						.transition(.opacity)
				}
				
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
									NavigationLink {
										DetailsView(model: task)
									} label: {
										Label("Редактировать", systemImage: "square.and.pencil")
									}
									
									Divider()
									
									ShareLink(item: [task.title, task.description]
										.compactMap { $0 }
										.joined(separator: "\n")) {
											Label("Поделиться", systemImage: "square.and.arrow.up")
										}
									
									Divider()
									
									Button(role: .destructive) {
										// FIXME: - Создать менеджер с методом удаления таски
									} label: {
										Label("Удалить", systemImage: "trash")
									}
								}
//								.simultaneousGesture(
//									LongPressGesture(minimumDuration: 0.3)
//										.onEnded { _ in
//											self.selectedTask = task
//										}
//								)
								.onTapGesture {
									self.selectedTask = task
								}
								.onDisappear {
									self.selectedTask = nil
								}
							
								.blur(radius: selectedTask == nil || selectedTask?.id == task.id ? 0 : 12)
						}
						.listRowBackground(Color.clear)
						.listRowSeparatorTint(.appStroke)
					}
					.listStyle(.plain)
					.navigationTitle("Задачи")
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
			.navigationBarHidden(true)
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
