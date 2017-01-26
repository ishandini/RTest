//
//  Extensions.swift
//  RTest
//
//  Created by Ishan Weerasooriya on 1/25/17.
//  Copyright © 2017 Ishan Weerasooriya. All rights reserved.
//

import Foundation
import UIKit

extension Dictionary {
    mutating func update(other: Dictionary) {
        for (key, value) in other {
            self.updateValue(value, forKey: key)
        }
    }
}

extension String {
    func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}
