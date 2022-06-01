import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var isStarted: Bool = false
    var isWorkTime: Bool = true
    var secondsCurrent = 0
    let secondsRest = 300
    let secondsWork = 1500
    
    @IBOutlet weak var timeLabel: UILabel!
    
    var circularProgressBarView = CircularProgressBarView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCircularProgressBarView()
    }
    
    func setUpCircularProgressBarView() {
        circularProgressBarView = CircularProgressBarView(frame: .zero)
        circularProgressBarView.center = view.center
        view.addSubview(circularProgressBarView)
    }
    
    @IBOutlet weak var startStopButton: UIButton!
    @IBAction func startStopButton(_ sender: Any) {
        if (isStarted) {
            isStarted = false
            timer.invalidate()
            startStopButton.setTitle("Start", for: .normal)
        } else {
            isStarted = true
            startStopButton.setTitle("Stop", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:
            #selector(tick), userInfo: nil, repeats: true )
        }
    }
    
    @objc func tick() {
        secondsCurrent += 50
        if  (isWorkTime) {
            startStopButton.tintColor = .red
            circularProgressBarView.setProgress(to: CGFloat(secondsCurrent) / CGFloat(secondsWork), with: .red)
            let workTime = secondsWork - secondsCurrent
            timeLabel.text = String(format:"%02i:%02i", workTime / 60, workTime % 60)
            if workTime == 0{
                isWorkTime = false
                secondsCurrent = 0
            }
        } else {
            startStopButton.tintColor = .green
            circularProgressBarView.setProgress(to: CGFloat(secondsCurrent) / CGFloat(secondsWork), with: .green)
            let restTime = secondsRest - secondsCurrent
            timeLabel.text = String(format:"%02i:%02i", restTime / 60, restTime % 60)
            if restTime == 0 {
                isWorkTime = true
                secondsCurrent = 0
            }
        }
    }
}



