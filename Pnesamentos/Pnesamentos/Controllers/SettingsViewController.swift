//
//  SettingsViewController.swift
//  Pnesamentos
//
//  Created by Luiz Guilherme on 04/06/20.
//  Copyright © 2020 Luiz Guilherme. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var swAutoRefresh: UISwitch!
    @IBOutlet weak var slTimeInterval: UISlider!
    @IBOutlet weak var scColorSkin: UISegmentedControl!
    @IBOutlet weak var lbTimeInterval: UILabel!
    
    let config = Configuration.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Refresh"), object: nil, queue: nil) { (notification) in
            self.formatView()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formatView()
    }
    
    func formatView(){
        swAutoRefresh.setOn(config.autoRefresh, animated: false)
        slTimeInterval.setValue(Float(config.timeInterval), animated: false)
        scColorSkin.selectedSegmentIndex = config.colorScheme
        changeTimeIntervalLabel(with: config.timeInterval)
    }
    
    func changeTimeIntervalLabel(with value: Double){
        lbTimeInterval.text = "Mudar apos \(Int(value)) segundos"
    }

    @IBAction func changeAutoRefresh(_ sender: UISwitch) {
        config.autoRefresh = sender.isOn
    }
    
    
    @IBAction func changeTimeInterval(_ sender: UISlider) {
        let value = Double(round(sender.value))
        changeTimeIntervalLabel(with: value)
        config.timeInterval = value
    }
    
    
    @IBAction func changeColorSkin(_ sender: UISegmentedControl) {
        config.colorScheme = sender.selectedSegmentIndex
    }
    
}
