//
//  MarvelWrapperJSON.swift
//  
//
//  Created by Gabriel Schmit Dall Agnol on 21/07/20.
//

import Foundation

struct MarvelWrapperJSON<H: Codable>: Codable {

    // MARK: - Init

    init(data: H?, status: String?) {
        self.data = data
        self.status = status
    }

    init(status: String?, code: Int?, data: H?) {
        self.code = code
        self.status = status
        self.data = data
    }

    // MARK: - Properties

    var data: H? = nil
    var status: String? = nil
    var code: Int? = nil

}
