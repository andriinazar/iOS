//
//  RectangleBace.swift
//  homework11
//
//  Created by Andrii Nazar on 11/2/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import Foundation

public class RectangleBace: Figure {    
    var sideLenght:[Double] {
        get {
            return calculateSideLenght()
        }
    }
    
    init? (points: [Point]) {
        if points.count != 4 {
            return nil
        }
        super.init(type: FigureType.Rectangle, points: points)
        if (!validatePoints(pointsForValidation: points)) {
            return nil
        }
    }
    
    init? (points: Point...) {
        if points.count != 4 {
            return nil
        }
        super.init(type: FigureType.Rectangle, points: points)
        if (!validatePoints(pointsForValidation: points)) {
            return nil
        }
    }
    
    func calculateSideLenght() -> [Double] {
        var sideLenght: [Double] = []
        sideLenght.append(Point.calculateDistance(start: self.points[0], end: self.points[1]))
        sideLenght.append(Point.calculateDistance(start: self.points[1], end: self.points[2]))
        sideLenght.append(Point.calculateDistance(start: self.points[2], end: self.points[3]))
        sideLenght.append(Point.calculateDistance(start: self.points[3], end: self.points[0]))
        return sideLenght
    }
    
    public override func getPerimetr() -> Double {
        var perimeter: Double = 0
        for lenght in sideLenght {
            perimeter += lenght
        }
        return perimeter
    }
}
