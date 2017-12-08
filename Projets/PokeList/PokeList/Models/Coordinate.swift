//
//  Coordinate.swift
//  PokeList
//
//  Created by Ludovic Ollagnier on 07/12/2017.
//  Copyright © 2017 Human Coders. All rights reserved.
//

import Foundation

struct Coordinate: Codable {
    let latitude: Double
    let longitude: Double
}

protocol Mappable {
    var coordinates: Coordinate { get }
    var name: String { get }
}
