//
//  ImageStruct.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/27/22.
//

import Foundation
import UIKit

struct ImageStruct: Identifiable, Codable, Hashable  {
    var id: String
    var car: String
    var date: Date
    var imageURL: String
}
