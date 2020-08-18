//
//  JSONToEntityTransform.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 21/07/20.
//

import Foundation

protocol JSONToEntityTransform {
    associatedtype Entity
    associatedtype JSON: Decodable

    var json: JSON { get set }

    func execute() throws -> Entity
}
