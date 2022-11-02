//
//  Rating.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/2/22.
//

import Foundation

struct Rating: Identifiable {
    var id = UUID()
    var car: Car
    var stars: Int
    var description: String
}
