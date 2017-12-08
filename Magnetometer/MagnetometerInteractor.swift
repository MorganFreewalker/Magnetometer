//
//  MagnetometerInteractor.swift
//  Magnetometer
//
//  Created by Maxim Tovchenko on 08.12.2017.
//  Copyright © 2017 Maxim Tovchenko. All rights reserved.
//

import Foundation

protocol MagnetometerInteractorProtocol {
    var presenter: MagnetometerPresenterProtocol? {get set}
    var magnetometerManager: MagnetometerManagerProtocol? {get set}
    func update(magnetometerDataStruct: MagnetometerDataStruct)
    func startUpdate()
    func stopUpdate()
}

class MagnetometerInteractor: MagnetometerInteractorProtocol {
    func startUpdate() {
        magnetometerManager?.start()
        print("StartInteractor")
    }
    
    func stopUpdate() {
        magnetometerManager?.stop()
        print("StopInteractor")
    }
    
    func update(magnetometerDataStruct: MagnetometerDataStruct) {
        print(magnetometerDataStruct)
        presenter?.update(magnetometerDataStruct: magnetometerDataStruct)
    }
    
    
    var presenter: MagnetometerPresenterProtocol?
    var magnetometerManager: MagnetometerManagerProtocol?
    
}
