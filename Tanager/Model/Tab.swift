//
//  Tab.swift
//  Tanager
//
//  Created by Jonathan Arbogast on 3/10/18.
//  Copyright © 2018 Jonathan Arbogast. All rights reserved.
//

import Foundation

struct Color: Codable {
    var color: String
    var context: String
    var theme: String
}

struct Icon: Codable {
    var contentType: String
    var height: Int?
    var theme: String
    var url: URL
    var width: Int?
}

struct Tab: Codable {
    var colors: [Color]
    var custom: Bool
    var iconUrl: URL
    var icons: [Icon]
    var label: String
    var miniIconUrl: URL
    var name: String
    var sobjectName: String
    var url: URL
}
