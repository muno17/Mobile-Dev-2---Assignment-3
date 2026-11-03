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
        HStack {
            Text(book.bookTitle)
                .font(.title2)
            Text(book.bookAuthor)
                .font(.body)
            
            Spacer()
            
            Button(action: {
                favorites.toggleFavoriteBook(book: book)
            }) {
                Image(systemName: book.isFavorite ? "heart.fill" : "heart")
                    .foregroundStyle(book.isFavorite ? .red : .gray)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    BooksRowView(book: BookModel(id: 1, bookTitle: "Test Book", bookAuthor: "Test Author"))
}
