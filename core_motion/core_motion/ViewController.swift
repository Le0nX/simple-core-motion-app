//
//  ViewController.swift
//  core_motion
//
//  Created by Denis Nefedov on 11/01/2019.
//  Copyright © 2019 X. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    
    var motionManager: CMMotionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates(to: .main, withHandler: updateLabels)
    }
    
    func updateLabels(data: CMAccelerometerData?, error: Error?) {
        guard let accelerometerData = data else { return }
        
        let formater = NumberFormatter()
        formater.minimumFractionDigits = 1
        formater.maximumFractionDigits = 1
        
        let x = formater.string(for:accelerometerData.acceleration.x)!
        let y = formater.string(for:accelerometerData.acceleration.y)!
        let z = formater.string(for:accelerometerData.acceleration.z)!
        
        xLabel.text = "X: \(x)"
        yLabel.text = "Y: \(y)"
        zLabel.text = "Z: \(z)"
        
    }

}

