//
//  DemoURL.swift
//  Cassini
//
//  Created by Carolina Salamanca on 7/21/20.
//  Copyright © 2020 Carolina Salamanca. All rights reserved.
//

import Foundation

struct DemoURLs{
    static let image = Bundle.main.url(forResource: "demoImage", withExtension: "jpg")
    
    static var NASA: Dictionary<String, URL> = {
        let NASAURLStrings = [
            "Cassini":"https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/pia21923-nasa.jpg",
            "Earth": "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/iss063e025120.jpg",
            "Saturn": "https://solarsystem.nasa.gov/system/resources/detail_files/17849_PIA14943-800w.jpg"
        ]
        var urls = Dictionary<String,URL>()
        for (key, value) in NASAURLStrings {
            urls[key] = URL(string: value)
        }
        return urls
    }()
}
