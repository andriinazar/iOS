import Foundation

// Good solution in this case are use abstract class,
//but Swift don't support it
public class Figure {
    public enum FigureType {
        case Unknown
        case Line
        case Triangle
        case Rectangle
    }
    var points: [Point]
    var figureType: FigureType
    init? (type: FigureType, points: [Point]) {
        self.figureType = type
        self.points = points
    }
    init? (type: FigureType, points: Point...) {
        self.figureType = type
        self.points = points
    }
    
    func getSquere() -> Double {
        return 0
    }
    
    func getPerimetr() -> Double {
        return 0
    }
    
    func validatePoints(pointsForValidation: [Point]) -> Bool {
        var pointSet: Set<Point> = []
        for point in pointsForValidation {
            pointSet.insert(point)
        }
        if (pointSet.count == pointsForValidation.count) {
            return true
        } else {
            return false
        }
    }
    
}
