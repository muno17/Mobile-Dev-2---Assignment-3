//
//  HobbyRowView.swift
//  Favorites
//
//  Created by Danny Muñoz on 11/2/26.
//

import SwiftUI

struct HobbyRowView: View {
    let hobby: HobbyModel
    @EnvironmentObject private var favorites: FavoritesViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Text(hobby.hobbyIcon)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.accentColor.opacity(0.1))
                .cornerRadius(8)
            
            Text(hobby.hobbyName)
                .font(.headline)
                .fontWeight(.bold)
            
            Spacer()
            
            Button(action: {
                favorites.toggleFavoriteHobby(hobby: hobby)
            }) {
                Image(systemName: hobby.isFavorite ? "heart.fill" : "heart")
                    .font(.title3)
                    .foregroundStyle(hobby.isFavorite ? .red : .gray)
            }
            .buttonStyle(.plain)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
    }
}

#Preview {
    HobbyRowView(hobby: HobbyModel(id: 1, hobbyName: "Hiking", hobbyIcon: "🥾"))
        .environmentObject(FavoritesViewModel())
        .padding()
}
