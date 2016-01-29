//
//  HappinessViewController.swift
//  Happiness
//
//  Created by trevor jordet on 1/27/16.
//  Copyright (c) 2016 jord3t. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource
{
    
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            println("happiness = \(happiness)")
            faceView.dataSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
        }
    }
    
    var happiness: Int = 75 {
        didSet {
            happiness = min(max(happiness, 0), 100)
            println("happiness = \(happiness)")
            //updateUI()
        }
    }
    
    private func updateUI()
    {
        faceView.setNeedsDisplay()
    }
    
    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness-50)/50
    }
}
