//
//  MovieListApp+Bundle.swift
//  MovieListApp
//
//  Created by Jisoo HAM on 1/14/24.
//

import Foundation

extension Bundle {
    static func parsePlist(ofName name: String) -> [String: AnyObject] {
        guard let plistURL = Bundle.main.url(forResource: name, withExtension: "plist") else {
            fatalError("Couldn't find file '\(name).plist' .")
        }
        
        guard let plistData = try? Data(contentsOf: plistURL),
              let dict = try? PropertyListSerialization.propertyList(from: plistData, format: nil) as? [String: AnyObject] else {
            fatalError("Couldn't load dictionary from data.")
        }
        
        return dict
    }
}
