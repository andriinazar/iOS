import UIKit
import Foundation

// Task1
struct Point {
    //01
    var x: Double = 0
    var y: Double = 0
    var radius: Double = 0
    var angle: Double = 0
    
    static let TYPE_DECART = 0
    static let TYPE_POLAR = 1
    
    //02
    init (x: Double, y: Double) {
        self.x = x
        self.y = y
        self.radius = sqrt((x * x) + (y * y))
        self.angle = atan(x/y)
    }
    
    init (radius: Double, angle: Double) {
        self.radius = radius
        self.angle = angle
        self.x = radius * cos(angle)
        self.y = radius * sin(angle)
    }
    
    //03
    mutating func move(dx: Double, dy: Double) -> Point {
        self.x = self.x + dx
        self.y = self.y + dy
        self.radius = sqrt((self.x * self.x ) + (self.y * self.y))
        self.angle = atan(self.x / self.y)
        return self
    }
    
    mutating func move(newRadius: Double, newAngle: Double) -> Point {
        self.radius = self.radius + newRadius
        self.angle = self.angle + newAngle
        self.x = self.radius * cos(self.angle)
        self.y = self.radius * sin(self.angle)
        return self
    }
    
    //04
    
    func description(_ coordinateType: Int) -> String {
        if coordinateType == 0 {
            return String("Polar coordinate: radius = \(self.radius), angle = \(self.angle)")
        } else {
            return String("Decart coordinate: x = \(self.x), y = \(self.y)")
        }
    }
    
}


//05
extension Point {
    func calculateDistance(point1: Point, point2: Point) -> Double {
        return sqrt(pow((point2.x - point1.x), 2) + pow((point2.y - point1.y), 2) )
    }
}

//06
struct CartesianCoordinates {
    var x: Double
    var y: Double
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}

struct PolarCoordinates {
    var radius: Double
    var angle: Double
    init(radius: Double, angle: Double) {
        self.radius = radius
        self.angle = angle
    }
}

extension Point {
    init(coordinate: CartesianCoordinates) {
        self.init(x: coordinate.x, y: coordinate.y)
    }
    
    init(coordinate: PolarCoordinates) {
        self.init(radius: coordinate.radius, angle: coordinate.angle)
    }
}

//07
extension Point {
    static func getDecardCoord(point: Point) -> (x: Double, y:Double) {
        return (point.x, point.y)
    }
    
    static func getPolarCoordinates(point: Point) -> (radius: Double, angle:Double) {
        return (point.radius, point.angle)
    }
    
    static func getCartesianCoordinates(point: CartesianCoordinates) -> (x: Double, y:Double) {
        return (point.x, point.y)
    }
    
    static func getPolarCoordinates(point: PolarCoordinates) -> (radius: Double, point:Double) {
        return (point.radius, point.angle)
    }
}


var point: Point = Point(x:10, y:10)
print(point.description(Point.TYPE_DECART))
print(point.description(Point.TYPE_POLAR))

point.move(dx: 20, dy: 20)
print(point.description(Point.TYPE_DECART))
print(point.description(Point.TYPE_POLAR))

var polarCoord: PolarCoordinates = PolarCoordinates(radius:10, angle: 0.2)
var decardCoord: CartesianCoordinates = CartesianCoordinates(x:10, y: 15)

print(Point.getCartesianCoordinates(point: decardCoord))
print(Point.getPolarCoordinates(point: polarCoord))
print(Point.getPolarCoordinates(point: point))
print(Point.getDecardCoord(point: point))




