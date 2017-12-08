//
//  ViewController.swift
//  Magnetometer
//
//  Created by Maxim Tovchenko on 08.12.2017.
//  Copyright © 2017 Maxim Tovchenko. All rights reserved.
//

import UIKit

protocol MagnetometerViewProtocol {
    func setUpdated(magnetometerDataStruct: MagnetometerDataStruct)
    var presenter: MagnetometerPresenterProtocol? {get set}
}

class MagnetometerViewController: UIViewController, MagnetometerViewProtocol {
    var presenter: MagnetometerPresenterProtocol?
    
    @IBOutlet weak var xLabel: UIProgressView!
    @IBOutlet weak var yLabel: UIProgressView!
    @IBOutlet weak var zLabel: UIProgressView!
    @IBOutlet weak var switcherOutlet: UILabel!
    
    func setUpdated(magnetometerDataStruct: MagnetometerDataStruct) {
        xLabel.setProgress((Float(magnetometerDataStruct.x)/500)+0.5, animated: false)
//        print(((Float(magnetometerDataStruct.x))/500)+0.5
        yLabel.setProgress((Float(magnetometerDataStruct.y)/500)+0.5, animated: false)
            print((Float(magnetometerDataStruct.y)/500)+0.5)
        //zLabel.setProgress(Float(abs(Int(magnetometerDataStruct.z)))/500, animated: false)
       //     print((Float(magnetometerDataStruct.z))/500)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.presenter = MagnetometerPresenter()
        let interactor = MagnetometerInteractor()
        var manager = MagnetometerManager.shared
        
        self.presenter?.magnetometerInteractor = interactor
        self.presenter?.magnetometerView = self
        interactor.magnetometerManager = manager
        interactor.presenter = presenter
        manager.interactor = interactor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func switcher(_ sender: UISwitch) {
        if sender.isOn {
            self.presenter!.startUpdatePressed()
            self.switcherOutlet.text = "ON"
            print("StartView")
        } else {
            self.presenter!.stopUpdatePressed()
            self.switcherOutlet.text = "OFF"
            print("StopView")
        }
    }
    
}

