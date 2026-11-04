//
//  FavoritesView.swift
//  Favorites
//
//  Created by Danny Muñoz on 11/2/26.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favorites: FavoritesViewModel
    
    var body: some View {
        List {
            // MARK: - Hobbies Section
            Section(header: Text("Hobbies")) {
                let favoriteHobbies = favorites.hobbies.filter { hobby in
                    hobby.isFavorite
                }
                
                if favoriteHobbies.isEmpty {
                    Text("No favorite hobbies yet.")
                        .foregroundColor(.secondary)
                } else {
                    ForEach(favoriteHobbies) { hobby in
                        HStack {
                            Text(hobby.hobbyName)
                            Spacer()
                            Button {
                                favorites.toggleFavoriteHobby(hobby: hobby)
                            } label: {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(.red)
                            }
                            .buttonStyle(.plain) // Keeps the tap target limited to the heart
                        }
                    }
                }
            }
            
            // MARK: - Cities Section
            Section(header: Text("Cities")) {
                let favoriteCities = favorites.cities.filter { city in
                    city.isFavorite
                }
                
                if favoriteCities.isEmpty {
                    Text("No favorite cities yet.")
                        .foregroundColor(.secondary)
                } else {
                    ForEach(favoriteCities) { city in
                        HStack {
                            Text(city.cityName)
                            Spacer()
                            Button {
                                favorites.toggleFavoriteCity(city: city)
                            } label: {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(.red)
                            }
                            .buttonStyle(.plain) // Keeps the tap target limited to the heart
                        }
                    }
                }
            }
            
            // MARK: - Books Section
            Section(header: Text("Books")) {
                let favoriteBooks = favorites.books.filter { book in
                    book.isFavorite
                }
                
                if favoriteBooks.isEmpty {
                    Text("No favorite books yet.")
                        .foregroundColor(.secondary)
                } else {
                    ForEach(favoriteBooks) { book in
                        HStack {
                            Text(book.bookTitle)
                            Spacer()
                            Button {
                                favorites.toggleFavoriteBook(book: book)
                            } label: {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(.red)
                            }
                            .buttonStyle(.plain) // Keeps the tap target limited to the heart
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    FavoritesView()
        .environmentObject(FavoritesViewModel())
}
