//
//  Triangle.swift
//  homework11
//
//  Created by Andrii Nazar on 11/2/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import Foundation

public class Triangle: Figure {
    public enum AngleType {
        case Acute // гострокутні
        case Right // прямокутні
        case Obtuse // тупокутні
    }
    
    public enum PartiesType {
        case Equilateral // рівносторонні
        case Isosceles // рівнобедренні
        case Scalene // різносторонні
    }
    
    var angles:[Double] {
        get {
            return calculateAndgels()
        }
    }
    
    var sideLenght:[Double] {
        get {
            return calculateSideLenght()
        }
    }
    
    public var triangleType: (AngleType, PartiesType) {
        get {
            return calculateTriangleType()
        }
    }
    
    public init? (points: [Point]) {
        if points.count != 3 {
            return nil
        }
        super.init(type: FigureType.Triangle, points: points)
        if (!validateTriangle()) {
            return nil
        }
    }
    
    public init? (points: Point...) {
        if points.count != 3 {
            return nil
        }
        super.init(type: FigureType.Triangle, points: points)
        if (!validateTriangle()) {
            return nil
        }
    }
    
    func calculateSideLenght() -> [Double] {
        var sideLenght: [Double] = []
        sideLenght.append(Point.calculateDistance(start: self.points[0], end: self.points[1]))
        sideLenght.append(Point.calculateDistance(start: self.points[1], end: self.points[2]))
        sideLenght.append(Point.calculateDistance(start: self.points[2], end: self.points[0]))
        return sideLenght
    }
    
    func calculateAndgels() -> [Double] {
        var angels:[Double] = []
        angels.append(180 - (180 / Double.pi) * acos((pow(sideLenght[0], 2) - pow(sideLenght[1], 2) - pow(sideLenght[2], 2)) / (2 * sideLenght[1] * sideLenght[2])))
        angels.append(180 - (180 / Double.pi) * acos((pow(sideLenght[1], 2) - pow(sideLenght[0], 2) - pow(sideLenght[2], 2)) / (2 * sideLenght[0] * sideLenght[2])))
        angels.append(180 - (180 / Double.pi) * acos((pow(sideLenght[2], 2) - pow(sideLenght[0], 2) - pow(sideLenght[1], 2)) / (2 * sideLenght[1] * sideLenght[0])))
        return angels
    }
    
    func calculateTriangleType() -> (angleType: AngleType, partiesType: PartiesType) {
        return (checkAngleType(), checkPartiesType())
    }
    
    func checkAngleType() -> AngleType {
        let angleType: AngleType
        if angles.contains(90) {
            angleType = AngleType.Right
        } else {
            let angleMap = angles.filter({$0 < 90})
            if angleMap.count == 3 {
                angleType = AngleType.Acute
            } else {
                angleType = AngleType.Obtuse
            }
        }
        return angleType
    }
    
    func checkPartiesType() -> PartiesType {
        var uniqueParties: Set<Double> = []
        uniqueParties.insert(sideLenght[0])
        uniqueParties.insert(sideLenght[1])
        uniqueParties.insert(sideLenght[2])
        
        switch uniqueParties.count {
        case 3:
            return PartiesType.Equilateral
        case 2:
            return PartiesType.Isosceles
        default:
            return PartiesType.Scalene
        }
    }
    
    private func validateTriangle() -> Bool {
        if (!validatePoints(pointsForValidation: self.points)) {
            return false
        }
        if (angles.contains(0) || angles.contains(180)) {
            return false
        }
        return true
    }
    
    public override func getPerimetr() -> Double {
        var perimeter: Double = 0
        for lenght in sideLenght {
            perimeter += lenght
        }
        return perimeter
    }
    
    public override func getSquere() -> Double {
        // for calculate using Heron's formula
        let halfPerimeter = getPerimetr() / 2
        return sqrt(halfPerimeter * (halfPerimeter - sideLenght[0]) * (halfPerimeter - sideLenght[1]) * (halfPerimeter - sideLenght[2]))
    }
}
