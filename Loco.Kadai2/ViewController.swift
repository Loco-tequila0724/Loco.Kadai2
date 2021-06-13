import UIKit

class ViewController: UIViewController {
    @IBOutlet weak private var firstTextField: UITextField!
    @IBOutlet weak private var secondTextField: UITextField!
    @IBOutlet weak private var segmentedControlFourArithmeticOperations: UISegmentedControl!
    @IBOutlet weak private var calculateDisplayLabel: UILabel!

    private func toDisplayCalculation() {
        let selectSegmentIndex: Int = segmentedControlFourArithmeticOperations.selectedSegmentIndex
        guard let firstFieldNum = Double(firstTextField.text!), let secondFieldNum = Double(secondTextField.text!) else {
            calculateDisplayLabel.text! = "テキストフィールドが空欄です。"
            return }

        switch selectSegmentIndex {
        case 0:
            calculateDisplayLabel.text! = String(firstFieldNum + secondFieldNum)
        case 1:
            calculateDisplayLabel.text! = String(firstFieldNum - secondFieldNum)
        case 2:
            calculateDisplayLabel.text! = String(firstFieldNum * secondFieldNum)
        case 3:
            if firstFieldNum == 0 || secondFieldNum == 0 {
                calculateDisplayLabel.text! = "割り算には、０以外を記入。"
            } else {
                calculateDisplayLabel.text! = String(firstFieldNum / secondFieldNum)
            }
        default:
            break
        }
    }
    @IBAction private func calculateButton(_ sender: Any) {
        toDisplayCalculation()
    }
}
