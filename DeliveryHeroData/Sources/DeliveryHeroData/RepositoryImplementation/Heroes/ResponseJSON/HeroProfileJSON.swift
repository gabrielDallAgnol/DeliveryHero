//
//  HeroProfileJSON.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 21/07/20.
//

import Foundation

struct HeroProfileJSON: Codable {
    let description: String? 
    let id: Int?
    let name: String?
    let thumbnail: HeroThumbnailJSON?
}
