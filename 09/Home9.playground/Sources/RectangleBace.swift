import Foundation

public class RectangleBace: Figure {
    init? (points: [Point]) {
        if points.count != 4 {
            return nil
        }
        super.init(type: FigureType.Line, points: points)
        if (!validatePoints(pointsForValidation: points)) {
            return nil
        }
    }
    
    init? (points: Point...) {
        if points.count != 4 {
            return nil
        }
        super.init(type: FigureType.Line, points: points)
        if (!validatePoints(pointsForValidation: points)) {
            return nil
        }
    }
}
