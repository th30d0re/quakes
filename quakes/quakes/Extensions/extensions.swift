//
//  extensions.swift
//  quakes
//
//  Created by Emmanuel Theodore on 1/27/22.
//

import Foundation

extension String {
    func containsAny(of array: [String]) -> Bool {
        for item in array {
            if self.contains(item) {
                return true
            }
        }
        return false
    }
    
}
