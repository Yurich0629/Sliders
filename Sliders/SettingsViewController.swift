//
//  SettingsViewController.swift
//  Sliders
//
//  Created by Илья Десятов on 16.08.2023.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func colorDidChange(_ color: UIColor)
}

final class SettingsViewController: UIViewController {

    @IBOutlet private var colorView: UIView!
    
    @IBOutlet private var redColorValueLabel: UILabel!
    @IBOutlet private var greenColorValueLabel: UILabel!
    @IBOutlet private var blueColorValueLabel: UILabel!
    
    @IBOutlet private var redColorSlider: UISlider!
    @IBOutlet private var greenColorSlider: UISlider!
    @IBOutlet private var blueColorSlider: UISlider!
    
    var defaultColor: UIColor?
    
    weak var delegate: SettingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    
    private func setupViews() {
        colorView.layer.cornerRadius = 16
        colorView.layer.masksToBounds = true
        
        if let defaultColor = defaultColor {
            redColorSlider.setValue(Float(defaultColor.rgba.red), animated: false)
            greenColorSlider.setValue(Float(defaultColor.rgba.green), animated: false)
            blueColorSlider.setValue(Float(defaultColor.rgba.blue), animated: false)
        }
        
        updateColorView()
        updateColorValueLabels()
        
        
    }
    
    
    private func updateColorValueLabels() {
        let stringRoundedValue = { (value: Float)  in
            String(round(value * 100) / 100.0)
        }
        redColorValueLabel.text = stringRoundedValue(redColorSlider.value)
        greenColorValueLabel.text = stringRoundedValue(greenColorSlider.value)
        blueColorValueLabel.text = stringRoundedValue(blueColorSlider.value)
    }
    
    private func updateColorView() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value),
            alpha: 1
        )
    }
    
    @IBAction private func sliderValueDidChange(_ sender: UISlider) {
        updateColorValueLabels()
        updateColorView()
    }
    
    
    @IBAction func doneDidTab(_ sender: Any) {
        
        
        if let color = colorView.backgroundColor{
            delegate?.colorDidChange(color)
        }
        
        dismiss(animated: true)
        
    }
    
    
}

