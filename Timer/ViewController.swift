import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var isStarted: Bool = false
    var seconds = 1500
        {
        didSet {
            timeLabel.text = ("\(seconds / 60):\(seconds % 60)")
        }
        }
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startStopButton: UIButton!
    @IBAction func startStopButton(_ sender: Any)
        {
        if (isStarted)
        {
            isStarted = false
            timer.invalidate()
            startStopButton.setTitle("Start", for: .normal)
            
        } else {
            isStarted = true
            startStopButton.setTitle("Stop", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tick), userInfo: nil, repeats: true )
        }
        
        }
    
    @objc func tick()
        {
        seconds -= 1
        if seconds == 0 {
            timer.invalidate()
        }
    }
}

