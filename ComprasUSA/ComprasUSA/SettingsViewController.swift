//
//  SettingsViewController.swift
//  ComprasUSA
//
//  Created by Luiz Guilherme on 28/05/20.
//  Copyright © 2020 Luiz Guilherme. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tfDolar: UITextField!
    @IBOutlet weak var tfIOF: UITextField!
    @IBOutlet weak var tfStateTaxes: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tfDolar.text = tc.getFormattedValue(of: tc.dolar, withCurrency: "")
        tfIOF.text = tc.getFormattedValue(of: tc.iof, withCurrency: "")
        tfStateTaxes.text = tc.getFormattedValue(of: tc.stateTax, withCurrency: "")
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func setValues(){
        tc.dolar = tc.convertToDouble(string: tfDolar.text!)
        tc.iof = tc.convertToDouble(string: tfIOF.text!)
        tc.stateTax = tc.convertToDouble(string: tfStateTaxes.text!)
    }
    
}

extension SettingsViewController: UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        setValues()
    }
}
