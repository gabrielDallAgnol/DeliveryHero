//
//  HeroThumbnailJSON.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 21/07/20.
//

import Foundation

struct HeroThumbnailJSON: Codable {
    enum CodingKeys: String, CodingKey {
        case path
        case extensionString = "extension"
    }
    
    var path: String?
    var extensionString: String?
}


