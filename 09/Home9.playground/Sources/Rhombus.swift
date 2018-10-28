import Foundation

public class Rhombus: RectangleBace {
    
    public override init? (points: [Point]) {
        if points.count != 4 {
            return nil
        }
        super.init(points: points)
        if (!validatePoints(pointsForValidation: points)) {
            return nil
        }
    }
    
    public override init? (points: Point...) {
        if points.count != 4 {
            return nil
        }
        super.init(points: points)
        if (!validatePoints(pointsForValidation: points)) {
            return nil
        }
    }
    
    public override func getSquere() -> Double {
        let d1 = Point.calculateDistance(start: points[0], end: points[2])
        let d2 = Point.calculateDistance(start: points[1], end: points[3])
        return (d1 * d2) / 2
    }
    
}
