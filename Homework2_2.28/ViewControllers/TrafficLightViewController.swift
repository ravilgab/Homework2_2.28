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
    @IBOutlet weak var resetButton: UIButton!
    
    private let brightLight: CGFloat = 1
    private let dimLight: CGFloat = 0.2
    
    private var currentColor = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startButton.tintColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        resetButton.tintColor = UIColor.lightGray
        
        redView.layer.backgroundColor = #colorLiteral(red: 1, green: 0.0187217119, blue: 0, alpha: 1)
        yellowView.layer.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        greenView.layer.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)

        redView.alpha = dimLight
        yellowView.alpha = dimLight
        greenView.alpha = dimLight

        startButton.layer.cornerRadius = 10
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        redView.layer.cornerRadius = redView.layer.bounds.height / 2
        yellowView.layer.cornerRadius = yellowView.layer.bounds.height / 2
        greenView.layer.cornerRadius = greenView.layer.bounds.height / 2
    }
    
    @IBAction func startButtonPressed() {
        startButton.setTitle("Next", for: .normal)
        resetButton.tintColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        
        switch currentColor {
        case 0:
            redView.alpha = brightLight
            greenView.alpha = dimLight
            currentColor = 1
        case 1:
            yellowView.alpha = brightLight
            redView.alpha = dimLight
            currentColor = 2
        case 2:
            greenView.alpha = brightLight
            yellowView.alpha = dimLight
            currentColor = 0
        default:
            break
        }
    }
    
    @IBAction func resetButtonPressed() {
        startButton.setTitle("Start", for: .normal)
        resetButton.tintColor = UIColor.lightGray
        
        currentColor = 0
        
        redView.alpha = dimLight
        yellowView.alpha = dimLight
        greenView.alpha = dimLight
    }    
}
