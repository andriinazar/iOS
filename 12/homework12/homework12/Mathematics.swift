//
//  Mathematics.swift
//  homework11
//
//  Created by Andrii Nazar on 11/2/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import Foundation

public class Mathematics {
    var figureList: [Figure] = []
    
    public func addFiqure(figure: Figure) -> Mathematics {
        figureList.append(figure)
        return self
    }
    
    public init() {}
    
    public func addFiqure(figures: [Figure]) -> Mathematics {
        for figure in figures {
            figureList.append(figure)
        }
        return self
    }
    
    public func getMinSquere() -> (Double?, Figure?) {
        var squereList: [(Double, Figure)] = []
        for figure in figureList {
            squereList.append((figure.getSquere(), figure))
        }
        if (figureList.count == 0) {
            return (nil, nil)
        }
        
        var min:(Double?, Figure?) =  (figureList[0].getSquere(), figureList[0])
        
        for (squere, fiqure) in squereList {
            if (squere < min.0!) {
                min = (squere, fiqure)
            }
        }
        return min
    }
    
    public func getMaxSquere() -> (Double?, Figure?){
        var squereList: [(Double, Figure)] = []
        for figure in figureList {
            squereList.append((figure.getSquere(), figure))
        }
        if (figureList.count == 0) {
            return (nil, nil)
        }
        
        var max:(Double?, Figure?) =  (figureList[0].getSquere(), figureList[0])
        
        for (squere, fiqure) in squereList {
            if (squere > max.0!) {
                max = (squere, fiqure)
            }
        }
        return max
    }
    
    public func getMinPerimeter() -> (Double?, Figure?) {
        var squereList: [(Double, Figure)] = []
        for figure in figureList {
            squereList.append((figure.getPerimetr(), figure))
        }
        if (figureList.count == 0) {
            return (Double(0), nil)
        }
        
        var min:(Double?, Figure?) =  (figureList[0].getPerimetr(), figureList[0])
        
        for (perimeter, fiqure) in squereList {
            if (perimeter < min.0!) {
                min = (perimeter, fiqure)
            }
        }
        return min
    }
    
    public func getMaxPerimeter() -> (Double?, Figure?) {
        var squereList: [(Double, Figure)] = []
        for figure in figureList {
            squereList.append((figure.getPerimetr(), figure))
        }
        if (figureList.count == 0) {
            return (Double(0), nil)
        }
        
        var max:(Double?, Figure?) =  (figureList[0].getPerimetr(), figureList[0])
        
        for (perimeter, fiqure) in squereList {
            if (perimeter > max.0!) {
                max = (perimeter, fiqure)
            }
        }
        return max
    }
}

