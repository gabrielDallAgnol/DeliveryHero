//
//  MarvelContainerJSON.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 21/07/20.
//

import Foundation

struct MarvelContainerJSON<J: Codable>: Codable {
    
    // MARK: - Init
    
    init(results: J?, offset: Int?, limit: Int?, total: Int?, count: Int?) {
        self.results = results
        self.offset = offset
        self.limit = limit
        self.total = total
        self.count = count
        
    }
    
    // MARK: - Properties
    
    var results: J? = nil
    var offset: Int? = nil
    var limit: Int? = nil
    var total: Int? = nil
    var count: Int? = nil
    
}

