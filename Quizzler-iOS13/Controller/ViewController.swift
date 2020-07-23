
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    //var quizBrain = QuizBrain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! // True or False
        
        let isUserOutputRight = QuizBrain.quizBrain.checkAnswer(userAnswer)
        
        if isUserOutputRight
        {
            sender.backgroundColor = .green
            print("Right!!")
            
        }else{
            sender.backgroundColor = .red
            print("Wrong!!")
        }
        
        let nextQuestion = QuizBrain.quizBrain.nextQuestion()
        if(nextQuestion != -1)
        {
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        }else{
            let nextVC = storyboard?.instantiateViewController(withIdentifier: "DisplayResultViewController") as! DisplayResultViewController
            self.present(nextVC, animated: true, completion: nil)
        }
    }
    
    @objc func updateUI(){
        
        lblQuestion.text = QuizBrain.quizBrain.getQuestion()
        progressBar.progress = QuizBrain.quizBrain.getProgress()
        lblScore.text = "Score: \(QuizBrain.quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
}

