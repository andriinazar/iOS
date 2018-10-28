import Foundation


public class Line: Figure {
    public struct Vector {
        private (set) var module: Double = 0
        private (set) var scalar: Double = 0
        init(start: Point, end: Point) {
            self.module = calculateModule(start: start, end: end)
            self.scalar = calculateScalar(start: start, end: end)
        }
        
        func calculateModule(start: Point, end: Point) -> Double {
            return sqrt(pow(end.getX() - start.getX(), 2) + pow(end.getY() - start.getY(), 2))
        }
        
        func calculateScalar(start: Point, end: Point) -> Double {
            return (start.getX() * end.getX()) + (start.getY() * end.getY())
        }
        
        func getAndle(vector: Vector) -> Double {
            return (self.scalar * vector.scalar) / (self.module * vector.module)
        }
        
        public var description: String {
            return String("Module: \(module) , Scalar: \(scalar)")
        }
        
    }
    private var startPoint: Point {
        get {
            return self.points[0]
        }
        
        set (newValue) {
            self.points[1] = newValue
        }
    
    }
    
    private var endPoint: Point {
        get{
            return self.points[1]
        }
        set (newValue) {
            self.points[1] = newValue
        }
    }
    
    private var distance: Double {
        get{
            return Point.calculateDistance(start: startPoint, end: endPoint)
        }
    }
    
    public var vector: Vector {
        get {
            return Vector(start: self.startPoint, end: self.endPoint)
        }
    }
    
    
    public init? (points: [Point]) {
        if points.count != 2 {
            return nil
        }
        super.init(type: FigureType.Line, points: points)
        self.startPoint = points[0]
        self.endPoint = points[1]
    }
    
    public init? (points: Point...) {
        if points.count != 2 {
            return nil
        }
        super.init(type: FigureType.Line, points: points)
        self.startPoint = points[0]
        self.endPoint = points[1]
    }
    
    public override func getSquere() -> Double {
        return 0
    }
    
    public override func getPerimetr() -> Double {
        return 0
    }
    
}

