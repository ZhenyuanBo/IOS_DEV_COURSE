import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft":300, "Medium": 420, "Hard": 720]
    
    var secondPassed=0
    var totalTime=0
    var timer = Timer()
    
    var player: AVAudioPlayer?
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        progressBar.progress = 0.0
        secondPassed = 0

        let hardness = sender.currentTitle!
        
        titleLabel.text = hardness
        
        switch hardness {
            case "Soft": totalTime = eggTimes["Soft"]!
            case "Medium": totalTime = eggTimes["Medium"]!
            case "Hard": totalTime = eggTimes["Hard"]!
            default: print("Error")
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondPassed < totalTime {
            secondPassed += 1
            progressBar.progress = Float(secondPassed)/Float(totalTime)
        }else{
            timer.invalidate()
            titleLabel.text = "DONE!"
            playSound()
        }
    }
    
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}
