//
//  ViewController.swift
//  MotionDemo
//
//  Created by 이원빈 on 2022/12/26.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    @IBOutlet weak var gx: UILabel!
    @IBOutlet weak var gy: UILabel!
    @IBOutlet weak var gz: UILabel!
    
    @IBOutlet weak var ax: UILabel!
    @IBOutlet weak var ay: UILabel!
    @IBOutlet weak var az: UILabel!
    
    let motion = CMMotionManager()
    var timer: Timer?
    // info.plist 에 Required device capability 이거 맞나
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gx.text = "gx"
        gy.text = "gy"
        gz.text = "gz"
        
        ax.text = "ax"
        ay.text = "ay"
        az.text = "az"
        startAccelerometers()
//        startGyros()
    }
    
    
    func startAccelerometers() {
       // Make sure the accelerometer hardware is available.
       if self.motion.isAccelerometerAvailable {
          self.motion.accelerometerUpdateInterval = 1.0 / 60.0  // 60 Hz
          self.motion.startAccelerometerUpdates()

          // Configure a timer to fetch the data.
          self.timer = Timer(fire: Date(), interval: (1.0/60.0),
                repeats: true, block: { (timer) in
             // Get the accelerometer data.
             if let data = self.motion.accelerometerData {
                let x = data.acceleration.x
                let y = data.acceleration.y
                let z = data.acceleration.z

                // Use the accelerometer data in your app.
                 self.ax.text = "ax: \(x)"
                 self.ay.text = "ay: \(y)"
                 self.az.text = "az: \(z)"
                 if x > 1.0 {
                     print("x +")
                 } else if x < -1.0 {
                     print("x -")
                 } else if y > 1.0 {
                     print("y +")
                 } else if y < -1.0 {
                     print("y -")
                 } else if z > 1.0 {
                     print("z +")
                 } else if z < -1.0 {
                     print("z -")
                 }
             }
          })

          // Add the timer to the current run loop.
           RunLoop.current.add(self.timer!, forMode: RunLoop.Mode.default)
       }
    }
    
    func startGyros() {
       if motion.isGyroAvailable {
          self.motion.gyroUpdateInterval = 1.0 / 30.0
          self.motion.startGyroUpdates()

          // Configure a timer to fetch the accelerometer data.
          self.timer = Timer(fire: Date(), interval: (1.0/60.0),
                 repeats: true, block: { (timer) in
             // Get the gyro data.
             if let data = self.motion.gyroData {
                let x = data.rotationRate.x
                let y = data.rotationRate.y
                let z = data.rotationRate.z

                // Use the gyroscope data in your app.
                 self.gx.text = "gx: \(x)"
                 self.gy.text = "gy: \(y)"
                 self.gz.text = "gz: \(z)"
                 if x > 3.0 {
                     print("x +")
                 } else if x < -3.0 {
                     print("x -")
                 } else if y > 3.0 {
                     print("y +")
                 } else if y < -3.0 {
                     print("y -")
                 } else if z > 3.0 {
                     print("z +")
                 } else if z < -3.0 {
                     print("z -")
                 }
             }
          })

          // Add the timer to the current run loop.
          RunLoop.current.add(self.timer!, forMode: RunLoop.Mode.default)
       }
    }
}

