//
//  TrafficLightViewController.swift
//  Homework2_2.28
//
//  Created by Ravil on 19.06.2022.
//

import UIKit

class TrafficLightViewController: UIViewController {

    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    
    enum Colors {
        case red
        case yellow
        case green
    }
    
    private let brightLight: CGFloat = 1
    private let dimLight: CGFloat = 0.2

    private var currentColor = Colors.red
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startButton.configuration = setupButton(title: "Start")
        
        redView.layer.backgroundColor = #colorLiteral(red: 1, green: 0.0187217119, blue: 0, alpha: 1)
        yellowView.layer.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        greenView.layer.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)

        redView.alpha = dimLight
        yellowView.alpha = dimLight
        greenView.alpha = dimLight
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        redView.layer.cornerRadius = redView.layer.bounds.height / 2
        yellowView.layer.cornerRadius = yellowView.layer.bounds.height / 2
        greenView.layer.cornerRadius = greenView.layer.bounds.height / 2
    }
    
    @IBAction func startButtonPressed() {
        startButton.setTitle("Next", for: .normal)
        
        switch currentColor {
        case .red:
            redView.alpha = brightLight
            greenView.alpha = dimLight
            currentColor = Colors.yellow
        case .yellow:
            yellowView.alpha = brightLight
            redView.alpha = dimLight
            currentColor = Colors.green
        case .green:
            greenView.alpha = brightLight
            yellowView.alpha = dimLight
            currentColor = Colors.red
        }
    }
    
    private func setupButton(title: String) -> UIButton.Configuration {
        var buttonConfiguration = UIButton.Configuration.filled()
        
        buttonConfiguration.baseBackgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        buttonConfiguration.title = title
        buttonConfiguration.cornerStyle = .large

        return buttonConfiguration
    }
}
