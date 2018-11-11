//
//  ViewController.swift
//  homework13
//
//  Created by Andrii Nazar on 11/11/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import UIKit

extension UIView {
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        next?.touchesEnded(touches, with: event)
        print("UIView touch")
    }
}

extension UIWindow {
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        next?.touchesEnded(touches, with: event)
        print("UIWindow touch")
    }
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        addUiView()
    }
    
    func addUiView() {
        var greenView : UIView = UIView(frame: CGRect(x: 10, y: 10, width: 200, height: 300))
        greenView.backgroundColor = UIColor.green
        addLable(view: &greenView)
        addButton(view: &greenView)
        self.view.addSubview(greenView)
    }
    
    func addButton(view: inout UIView) {
        let button: UIButton = UIButton(frame: CGRect(x: 50, y: 270, width: 100, height: 20))
        button.backgroundColor = UIColor.red
        button.setTitle("Click me", for: UIControl.State.normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
    }
    
    func addLable(view: inout UIView) {
        let label : UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 300))
        label.text = "x: \(view.frame.origin.x) y: \(view.frame.origin.y) \n h: \(view.frame.height)  w: \(view.frame.width)"
        label.textAlignment = NSTextAlignment.center
        label.numberOfLines = 2
        view.addSubview(label)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let newLocation = touches.first?.location(in: self.view)
        if let location = newLocation {
            for subview in self.view.subviews {
                //subview.frame = CGRect(x:location.x, y: location.y, width: subview.frame.size.width, height: subview.frame.size.height );
                subview.center = CGPoint(x: location.x, y: location.y)
                let labels = subview.subviews.compactMap { $0 as? UILabel }
                for label in labels {
                    DispatchQueue.main.async {
                        label.text = "x: \(subview.frame.origin.x) y: \(subview.frame.origin.y) \n h: \(subview.frame.height)  w: \(subview.frame.width)"
                    }
                    print("x: \(subview.frame.origin.x) y: \(subview.frame.origin.y) \n h: \(subview.frame.height)  w: \(subview.frame.width)")
                }
            }
        }
        next?.touchesEnded(touches, with: event)
        print("Controller touch")
    }
}

