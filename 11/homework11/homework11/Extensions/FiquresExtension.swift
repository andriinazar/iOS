//
//  FiqureExtension.swift
//  homework11
//
//  Created by Andrii Nazar on 11/2/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import Foundation

extension Figure {
    var description: String {
        get {
            return String("figure_type: \(self.figureType) \n squere: \(self.getSquere()) \n perimeter: \(self.getPerimetr()) ")
        }
    }
}

