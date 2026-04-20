//
//  DetailsView.swift
//  ToDoList
//
//  Created by Сергей Смирнов on 20.04.2026.
//

import SwiftUI

struct DetailsView: View {
	@Environment(\.dismiss) var dismiss
	@State var model: Task
	
	private let dayMonthFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "dd/MM/yy"
		return formatter
	}()
	
	var body: some View {
		VStack(alignment: .leading) {
			Button {
				// FIXME: - Create save changes methode
				dismiss()
			} label: {
				HStack {
					Image(systemName: "chevron.left")
						.resizable()
						.frame(width: 17, height: 22)
					Text("Назад")
						.font(.system(size: 17, weight: .regular, design: .rounded))
				}
				.foregroundStyle(.appYellow)
			}
			.padding(.bottom, 20)
			
			Text(model.title ?? "")
				.foregroundStyle(.white)
				.font(.system(size: 34, weight: .bold, design: .rounded))
			VStack(alignment: .leading) {
				Text(dayMonthFormatter.string(from: model.date ?? .now))
					.foregroundStyle(.gray)
					.font(.system(size: 12, weight: .regular, design: .rounded))
				TextEditor(text: $model.description)
					.scrollContentBackground(.hidden)
					.foregroundStyle(.white)
					.font(.system(size: 16, weight: .regular, design: .rounded))
					.background(.appBlack)
			}
		}
		.padding()
		.background(.appBlack)
		.navigationBarHidden(true)
	}
}
