import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var choice1Button: UIButton!
    
    @IBOutlet weak var choice2Button: UIButton!
    
    @IBOutlet weak var choice3Button: UIButton!
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userGotItRight = quizBrain.checkAnswer(sender.currentTitle!)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        //add a 0.2s delay before the question updates
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI(){
        
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        choice1Button.setTitle(quizBrain.getChoiceList()[0], for: .normal)
        choice2Button.setTitle(quizBrain.getChoiceList()[1], for: .normal)
        choice3Button.setTitle(quizBrain.getChoiceList()[2], for: .normal)
        
        choice1Button.backgroundColor = UIColor.clear
        choice2Button.backgroundColor = UIColor.clear
        choice3Button.backgroundColor = UIColor.clear
    }
}

