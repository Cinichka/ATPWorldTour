//
//  Animation.swift
//  ATPWorldTour
//
//  Created by Вероника Садовская on 08.07.2018.
//  Copyright © 2018 Veronika Sadovskaya. All rights reserved.
//

import UIKit
var spinnerBall: UIImageView!
let imageBall = UIImage(named: "tennis")
func animateBall(tableView: UITableView) {
    spinnerBall = UIImageView(image: imageBall)
    spinnerBall.translatesAutoresizingMaskIntoConstraints = false
    tableView.addSubview(spinnerBall)
    NSLayoutConstraint(item: spinnerBall, attribute: .centerX, relatedBy: .equal, toItem: tableView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
    NSLayoutConstraint(item: spinnerBall, attribute: .centerY, relatedBy: .equal, toItem: tableView, attribute: .centerY, multiplier: 0.85, constant: 0).isActive = true
    UIView.animate(withDuration: 0.3, delay:0, options: .repeat, animations: {
        spinnerBall.transform = CGAffineTransform(rotationAngle: (360.0 * .pi) / 360.0)
    }, completion: nil)
}

func animateBallStop () {
    spinnerBall.removeFromSuperview()
}
