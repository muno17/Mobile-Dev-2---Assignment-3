//
//  CityModel.swift
//  Favorites
//
//  Created by Danny Muñoz on 11/2/26.
//

import Foundation


struct BookModel : Identifiable {
    let id: Int
    let bookTitle: String
    let bookAuthor: String
    var isFavorite: Bool = false
}
