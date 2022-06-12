import UIKit

//MARK: - Model
struct Registrant {
    var name: String
    var phoneNumber: String
}

class ViewController: UIViewController {
    var registrantList: [Registrant] = [] {
        didSet {
            nc.addObserver(forName: Notification.Name("이건 그냥 통일해주면 여기로 오는거임"), object: nil, queue: nil) { Nofitication in
                self.check()
                print(Nofitication)
            }
        }
    }
    let NotificationName = Notification.Name("이렇게도 씁니다.")
    let nc = NotificationCenter.default
//MARK: - View
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
//MARK: - Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func hitRegisterButton(_ sender: Any) {
        register()
    }
    
    @IBAction func hitCheckButton(_ sender: Any) {
        
    }
    
    func register() {
        let registrant = Registrant(name: nameTextField.text!, phoneNumber: phoneNumberTextField.text!)
        registrantList.append(registrant)
        nameTextField.text = ""
        phoneNumberTextField.text = ""
        nc.post(name: Notification.Name("이건 그냥 통일해주면 여기로 오는거임"), object: nil, userInfo: nil)
    }
    /*
     컨트롤러는 모델에 명령을 보냄으로써 모델의 상태를 변경할 수 있다. (예: 워드 프로세서에서 문서를 편집하는 것) 또, 컨트롤러가 관련된 뷰에 명령을 보냄으로써 모델의 표시 방법을 바꿀 수 있다. (문서를 스크롤하는 것)
     */
    func check() {
        guard let end = registrantList.last else {
            return
        }

        nameLabel.text = end.name
        phoneNumberLabel.text = end.phoneNumber
    }
    
    func check1() {
        nameLabel.text = nameTextField.text
        phoneNumberLabel.text = phoneNumberTextField.text
    }
}

extension Array {
    func returnEndIdenx() -> Int? {
        if self.isEmpty {
            return nil
        } else {
            return self.count - 1
        }
    }
}
