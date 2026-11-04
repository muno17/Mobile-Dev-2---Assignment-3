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
        NavigationStack {
            List {
                Section(header: Text("Hobbies")) {
                    let favoriteHobbies = favorites.hobbies.filter { hobby in
                        hobby.isFavorite
                    }
                    
                    if favoriteHobbies.isEmpty {
                        Text("No favorite hobbies yet.")
                            .foregroundColor(.secondary)
                            .italic()
                    } else {
                        ForEach(favoriteHobbies) { hobby in
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
                                
                                Button {
                                    favorites.toggleFavoriteHobby(hobby: hobby)
                                } label: {
                                    Image(systemName: "heart.fill")
                                        .font(.title3)
                                        .foregroundColor(.red)
                                }
                                .buttonStyle(.plain)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
                
                Section(header: Text("Cities")) {
                    let favoriteCities = favorites.cities.filter { city in
                        city.isFavorite
                    }
                    
                    if favoriteCities.isEmpty {
                        Text("No favorite cities yet.")
                            .foregroundColor(.secondary)
                            .italic()
                    } else {
                        ForEach(favoriteCities) { city in
                            HStack(alignment: .center, spacing: 12) {
                                Image(systemName: "building.2.fill")
                                    .font(.title3)
                                    .frame(width: 40, height: 40)
                                    .background(Color.blue.opacity(0.1))
                                    .foregroundColor(.blue)
                                    .cornerRadius(8)
                                
                                Text(city.cityName)
                                    .font(.headline)
                                    .fontWeight(.bold)
                                
                                Spacer()
                                
                                Button {
                                    favorites.toggleFavoriteCity(city: city)
                                } label: {
                                    Image(systemName: "heart.fill")
                                        .font(.title3)
                                        .foregroundColor(.red)
                                }
                                .buttonStyle(.plain)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
                
                Section(header: Text("Books")) {
                    let favoriteBooks = favorites.books.filter { book in
                        book.isFavorite
                    }
                    
                    if favoriteBooks.isEmpty {
                        Text("No favorite books yet.")
                            .foregroundColor(.secondary)
                            .italic()
                    } else {
                        ForEach(favoriteBooks) { book in
                            HStack(alignment: .center, spacing: 12) {
                                Image(systemName: "book.fill")
                                    .font(.title3)
                                    .frame(width: 40, height: 40)
                                    .background(Color.orange.opacity(0.1))
                                    .foregroundColor(.orange)
                                    .cornerRadius(8)
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(book.bookTitle)
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    
                                    Text(book.bookAuthor)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                                
                                Button {
                                    favorites.toggleFavoriteBook(book: book)
                                } label: {
                                    Image(systemName: "heart.fill")
                                        .font(.title3)
                                        .foregroundColor(.red)
                                }
                                .buttonStyle(.plain)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

#Preview {
    FavoritesView()
        .environmentObject(FavoritesViewModel())
}
