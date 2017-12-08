//
//  MagnetometerManager.swift
//  Magnetometer
//
//  Created by Maxim Tovchenko on 08.12.2017.
//  Copyright © 2017 Maxim Tovchenko. All rights reserved.
//

import Foundation
import CoreMotion

protocol MagnetometerManagerProtocol {
    static var shared: MagnetometerManagerProtocol {get}
    var interactor: MagnetometerInteractorProtocol? {get set}
    func start()
    func stop()
}

struct MagnetometerDataStruct {
    var x: Double
    var y: Double
    var z: Double
}

class MagnetometerManager: MagnetometerManagerProtocol {
    
    var interactor: MagnetometerInteractorProtocol?
    static var shared: MagnetometerManagerProtocol = MagnetometerManager()
    
    private let magnetometer: CMMotionManager!
    private var timer: Timer?
    
    private init(){
        self.magnetometer = CMMotionManager()
        print("manager inited")
    }
    
    deinit {
        self.stop()
    }
    
    func start(){
        print("trying to start")
        if self.magnetometer.isMagnetometerAvailable {
            self.magnetometer.startMagnetometerUpdates()
            self.timer = Timer.scheduledTimer(withTimeInterval: 1/100, repeats: true, block: { (_) in
                if let validData = self.magnetometer.magnetometerData {
                    let magnetometerDataStruct = MagnetometerDataStruct(x: validData.magneticField.x, y: validData.magneticField.y, z: validData.magneticField.z)
                    self.interactor?.update(magnetometerDataStruct: magnetometerDataStruct)
                    print("MagnitometerUpdate: \(validData)")
                }
            })
        } else {
            print("Some shit with magnetometer:(")
        }
    }
    
    func stop() {
        self.magnetometer.stopMagnetometerUpdates()
        self.timer?.invalidate()
    }
}
