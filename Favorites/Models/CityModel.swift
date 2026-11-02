//
//  CityModel.swift
//  Favorites
//
//  Created by Danny Muñoz on 11/2/26.
//

import Foundation


struct CityModel : Identifiable {
    let id: Int
    let cityName: String
    let cityImage: String
    var isFavorite: Bool = false
}
