import UIKit

class ViewController: UIViewController {
    @IBOutlet weak private var firstTextField: UITextField!
    @IBOutlet weak private var secondTextField: UITextField!
    @IBOutlet weak private var segmentedControlFourArithmeticOperations: UISegmentedControl!
    @IBOutlet weak private var calculateDisplayLabel: UILabel!

    private func calculateAndDisplayResult() {
        guard let firstFieldNum = Double(firstTextField.text!), let secondFieldNum = Double(secondTextField.text!) else {
            calculateDisplayLabel.text! = "テキストフィールドが空欄です。"
            return
        }

        switch segmentedControlFourArithmeticOperations.selectedSegmentIndex {
        case 0:
            calculateDisplayLabel.text! = String(firstFieldNum + secondFieldNum)
        case 1:
            calculateDisplayLabel.text! = String(firstFieldNum - secondFieldNum)
        case 2:
            calculateDisplayLabel.text! = String(firstFieldNum * secondFieldNum)
        case 3:
            if secondFieldNum == 0 {
                calculateDisplayLabel.text! = "割る数には、０以外を記入。"
            } else {
                calculateDisplayLabel.text! = String(firstFieldNum / secondFieldNum)
            }
        default:
            break
        }
    }
    @IBAction private func calculateButton(_ sender: Any) {
        calculateAndDisplayResult()
    }
}
