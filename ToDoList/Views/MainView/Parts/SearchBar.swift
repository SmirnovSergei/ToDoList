//
//  SearchBar.swift
//  ToDoList
//
//  Created by Сергей Смирнов on 16.04.2026.
//

import SwiftUI

struct SearchBar: View {
	@Binding var text: String
	@State private var isEditing = false
	
	var body: some View {
		HStack(spacing: 14) {
			Image(systemName: "magnifyingglass")
				.foregroundStyle(.gray)
			
			TextField("Search",
					  text: $text,
					  prompt: Text("Search")
				.foregroundStyle(.gray)
			)
			.textInputAutocapitalization(.never)
			.disableAutocorrection(true)
			.onTapGesture {
				isEditing = true
			}
			
			if !text.isEmpty {
				Button {
					text = ""
				} label: {
					Image(systemName: "xmark.circle.fill")
				}
			} else {
				Button {
					// FIXME: - Найти как реализовать Voice typing
				} label: {
					Image(systemName: "microphone.fill")
				}
			}
			
			if isEditing {
				Button("Cancel") {
					text = ""
					isEditing = false
					UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
					to: nil, from: nil, for: nil)
				}
				.transition(.move(edge: .trailing))
				.animation(.default, value: isEditing)
			}
		}
		.padding(.vertical, 10)
		.padding(.horizontal, 20)
		.background(.appGray)
		.cornerRadius(10)
		.foregroundStyle(.gray)
	}
}
