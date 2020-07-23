
import UIKit

class DisplayResultViewController: UIViewController {

   // var quizBrain = QuizBrain()
    
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        if QuizBrain.quizBrain.getScore() > 5
        {
            lblResult.text = "Congratualations you passed Test! \nYour Score = \(QuizBrain.quizBrain.getScore())"
            imgView.image = #imageLiteral(resourceName: "thumb")
        }else{
            lblResult.text = "Better Luck Next Time! \nYour Score = \(QuizBrain.quizBrain.getScore())"
            imgView.image = #imageLiteral(resourceName: "sad")
        }
      
    }
    

    

}
