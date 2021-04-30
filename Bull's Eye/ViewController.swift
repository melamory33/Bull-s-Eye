//
//  ViewController.swift
//  Bull's Eye
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var hitButton: UIButton!
    @IBOutlet weak var startOverButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var slider: UISlider!

    var currentValue: Int = 1
    var targetValue: Int = 0
    var score = 0
    var round: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        hitButton.setTitle("Hit Me!", for: .normal)

        startNewRound()
    }

    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        score += points
        round += 1

        let title: String

        if difference == 0 {
            title = "Perfect!"
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }

        let message = "You scored \(points) points"

        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )

        let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler: { [weak self] _ in
                self?.startNewRound()
            }
        )

        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

    @IBAction func showInfoAlert() {

        let alert = UIAlertController(
            title: "Bull's Eye game",
            message: "Test app by Melamory",
            preferredStyle: .alert
        )

        let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil
        )

        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

    @IBAction func sliderChange(_ sender: UISlider) {
        currentValue = lroundf(sender.value)
    }

    @IBAction func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }

    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 1
        slider.value = Float(currentValue)
        updateLabels()
    }

    func updateLabels() {
        taskLabel.text = "Put the Bull's Eye as close as you can to: \(targetValue)"
        scoreLabel.text = "Score: \(score)"
        roundLabel.text = "Round: \(round)"
    }
}

