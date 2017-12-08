//
//  MagnetometerPresenter.swift
//  Magnetometer
//
//  Created by Maxim Tovchenko on 08.12.2017.
//  Copyright © 2017 Maxim Tovchenko. All rights reserved.
//

import Foundation

protocol MagnetometerPresenterProtocol {
    var magnetometerView: MagnetometerViewProtocol? {get set}
    var magnetometerInteractor: MagnetometerInteractorProtocol? {get set}
    func update(magnetometerDataStruct: MagnetometerDataStruct)
    func startUpdatePressed()
    func stopUpdatePressed()
}

class MagnetometerPresenter: MagnetometerPresenterProtocol {
    func startUpdatePressed() {
        magnetometerInteractor?.startUpdate()
        print("StartPresenter")
    }
    
    func stopUpdatePressed() {
        magnetometerInteractor?.stopUpdate()
        print("StopPresenter")
    }

    var magnetometerView: MagnetometerViewProtocol?
    var magnetometerInteractor: MagnetometerInteractorProtocol?
    
    func update(magnetometerDataStruct: MagnetometerDataStruct) {
        magnetometerView?.setUpdated(magnetometerDataStruct: magnetometerDataStruct)
    }
    
}
