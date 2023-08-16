//
//  MainViewController.swift
//  Sliders
//
//  Created by Илья Десятов on 16.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBAction func openSettingsDidTab(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openSettings" {
            if let settingsViewController = segue.destination as? SettingsViewController {
                settingsViewController.defaultColor = view.backgroundColor
                settingsViewController.delegate = self
            }
        }
    }
}

extension MainViewController: SettingsViewControllerDelegate{
    func colorDidChange(_ color: UIColor) {
        view.backgroundColor = color
    }
    
    
}
