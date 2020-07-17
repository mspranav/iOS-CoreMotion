//
//  ViewController.swift
//  iOS-CoreMotion
//
//  Created by Siva Soumya Mandadi on 7/15/20.
//  Copyright © 2020 edu.asu.se.smandad1. All rights reserved.
//

import UIKit
import CoreMotion
import CoreLocation


class ViewController: UIViewController {

    @IBOutlet weak var xAccel: UITextField!
    @IBOutlet weak var yAccel: UITextField!
    @IBOutlet weak var zAccel: UITextField!
    
    @IBOutlet weak var xDeviMLabel: UILabel!
    @IBOutlet weak var yDeviMLabel: UILabel!
    @IBOutlet weak var zDeviMLabel: UILabel!
    
    
    @IBOutlet weak var xDeviM: UITextField!
    @IBOutlet weak var yDeviM: UITextField!
    @IBOutlet weak var zDeviM: UITextField!
    
    
    var motion = CMMotionManager()
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Log: View Did Load")
        xDeviMLabel.text = "X DeviM"
        yDeviMLabel.text = "Y DeviM"
        zDeviMLabel.text = "Z DeviM"
        self.view.addSubview(xDeviMLabel)
        self.view.addSubview(yDeviMLabel)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        runAccelerometer()
        myDeviceMotion()
    }
    
    func runAccelerometer() {
        print("Start Accelerometer")
        motion.accelerometerUpdateInterval = 0.25
        motion.startAccelerometerUpdates(to: OperationQueue.current!) {
            (data, error) in
            print(data as Any)
            if let trueData =  data {
                
                self.view.reloadInputViews()
                self.xAccel!.text = "x: \(trueData.acceleration.x)"
                self.yAccel!.text = "y: \(trueData.acceleration.y)"
                self.zAccel!.text = "z: \(trueData.acceleration.z)"
            }
        }

        return
    }
    
    func myDeviceMotion(){
        print("Start DeviceMotion")
        motion.deviceMotionUpdateInterval  = 0.25
        motion.startDeviceMotionUpdates(to: OperationQueue.current!) {
            (data, error) in
            print(data as Any)
            if let trueData =  data {
                
                self.view.reloadInputViews()
                self.xDeviM!.text = "x (pitch): \(trueData.attitude.pitch)"
                self.yDeviM!.text = "y (roll): \(trueData.attitude.roll)"
                self.zDeviM!.text = "z (yaw): \(trueData.attitude.yaw)"
            }
        }
        return
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

