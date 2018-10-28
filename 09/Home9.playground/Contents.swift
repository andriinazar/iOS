import UIKit

var mathematic: Mathematics = Mathematics()

var line: Line? = Line(points: Point(x: 10, y: 10), Point(x: 30, y: 30))
if let line = line {
    print("Line")
    print(line.getSquere())
    print(line.getPerimetr())
    print(line.vector.description )
    mathematic.addFiqure(figure: line)
}

var triangle: Triangle? = Triangle(points: Point(x: 0, y: 0), Point(x: 0, y: 10), Point(x: 10, y: 0))
if let triangle = triangle {
    print("Triangle")
    print(triangle.getSquere())
    print(triangle.getPerimetr())
    print(triangle.triangleType)
    mathematic.addFiqure(figure: triangle)
}

var squere: Square? = Square(points:  Point(x: 0, y: 0), Point(x: 0, y: 10), Point(x: 10, y: 10), Point(x: 10, y: 0))
if let squere = squere {
    print("Squere")
    print(squere.getSquere())
    print(squere.getPerimetr())
    mathematic.addFiqure(figure: squere)
}

var rectangle: Rectangle? = Rectangle(points:  Point(x: 0, y: 0), Point(x: 0, y: 10), Point(x: 10, y: 10), Point(x: 10, y: 0))
if let rectangle = rectangle {
    print("Rectangle")
    print(rectangle.getSquere())
    print(rectangle.getPerimetr())
    mathematic.addFiqure(figure: rectangle)
}

var rhombus: Rhombus? = Rhombus(points:  Point(x: 0, y: 0), Point(x: 0, y: 10), Point(x: 10, y: 10), Point(x: 10, y: 0))
if let rhombus = rhombus {
    print("Rhombus")
    print(rhombus.getSquere())
    print(rhombus.getPerimetr())
    mathematic.addFiqure(figure: rhombus)
}

print(mathematic.getMaxPerimeter())
print(mathematic.getMinPerimeter())
print(mathematic.getMaxSquere())
print(mathematic.getMinSquere())
