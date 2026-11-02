//
//  CityModel.swift
//  Favorites
//
//  Created by Danny Muñoz on 11/2/26.
//

import Foundation


struct HobbyModel : Identifiable {
    let id: Int
    let hobbyName: String
    let hobbyIcon: String
    var isFavorite: Bool = false
}
