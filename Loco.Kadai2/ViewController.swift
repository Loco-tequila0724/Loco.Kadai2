import UIKit

// メソッド名には、動詞を初めに書く
// selectedSegmentIndexはいったん定数に入れず、switchに直接書いても大丈夫
// 0 ÷ 10 などは許容して（答えは10）、10 ÷ 0 などを禁止したいので（ゼロ除算。数学において、これを矛盾なく定義することはできない）、secondFieldNumのみをチェックします
// ゼロ除算 - Wikipedia

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
                calculateDisplayLabel.text! = "割り算には、０以外を記入。"
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
