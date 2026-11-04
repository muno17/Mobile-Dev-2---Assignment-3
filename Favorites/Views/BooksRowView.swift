//
//  BooksRowView.swift
//  Favorites
//
//  Created by Danny Muñoz on 11/3/26.
//

import SwiftUI

struct BooksRowView: View {
    let book: BookModel
    @EnvironmentObject private var favorites: FavoritesViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text(book.bookTitle)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text(book.bookAuthor)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Button(action: {
                favorites.toggleFavoriteBook(book: book)
            }) {
                Image(systemName: book.isFavorite ? "heart.fill" : "heart")
                    .font(.title3)
                    .foregroundStyle(book.isFavorite ? .red : .gray)
            }
            .buttonStyle(.plain)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
    }
}

#Preview {
    BooksRowView(book: BookModel(id: 1, bookTitle: "The Great Gatsby", bookAuthor: "F. Scott Fitzgerald"))
        .environmentObject(FavoritesViewModel())
        .padding()
}
