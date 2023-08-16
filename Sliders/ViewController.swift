//
//  ViewController.swift
//  Sliders
//
//  Created by Илья Десятов on 16.08.2023.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redColorValueLabel: UILabel!
    @IBOutlet var greenColorValueLabel: UILabel!
    @IBOutlet var blueColorValueLabel: UILabel!
    
    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        colorView.layer.cornerRadius = 16
        colorView.layer.masksToBounds = true
        
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
    
}

