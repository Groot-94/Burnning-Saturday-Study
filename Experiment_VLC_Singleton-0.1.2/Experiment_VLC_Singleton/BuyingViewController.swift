//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

class BuyingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("세컨드 뷰디드로드")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("세컨드 뷰윌어피어")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            print("세컨드 뷰디드어피어")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("세컨드 뷰윌디스어피어")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("세컨드 디드디스어피어")
    }
    
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapBuyButton(_ sender: UIButton) {
        PointManager.shared.point -= 50
        dismiss(animated: true)
    }
    
}
