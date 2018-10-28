import Foundation

//MARK: form home8
public struct Point: Hashable {
    //01
    private var x: Double = 0
    private var y: Double = 0
    private var radius: Double = 0
    private var angle: Double = 0
    
    static let TYPE_DECART = 0
    static let TYPE_POLAR = 1
    
    //02
    public init (x: Double, y: Double) {
        self.x = x
        self.y = y
        self.radius = sqrt((x * x) + (y * y))
        self.angle = atan(x/y)
    }
    
    public init (radius: Double, angle: Double) {
        self.radius = radius
        self.angle = angle
        self.x = radius * cos(angle)
        self.y = radius * sin(angle)
    }
    
    //03
    public mutating func move(dx: Double, dy: Double) -> Point {
        self.x = self.x + dx
        self.y = self.y + dy
        self.radius = sqrt((self.x * self.x ) + (self.y * self.y))
        self.angle = atan(self.x / self.y)
        return self
    }
    
    public mutating func move(newRadius: Double, newAngle: Double) -> Point {
        self.radius = self.radius + newRadius
        self.angle = self.angle + newAngle
        self.x = self.radius * cos(self.angle)
        self.y = self.radius * sin(self.angle)
        return self
    }
    
    //For task2
    public func getX() -> Double {
        return self.x
    }
    
    public func getY() -> Double {
        return self.y
    }
    
    //04
    public func description(_ coordinateType: Int) -> String {
        if coordinateType == 0 {
            return String("Polar coordinate: radius = \(self.radius), angle = \(self.angle)")
        } else {
            return String("Decart coordinate: x = \(self.x), y = \(self.y)")
        }
    }
    
    static func calculateDistance(start: Point, end: Point) -> Double {
        return sqrt(pow((end.x - start.x), 2) + pow((end.y - start.y), 2) )
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
