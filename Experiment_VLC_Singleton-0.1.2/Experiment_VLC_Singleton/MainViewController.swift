//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

class PointManager {
    static let shared = PointManager()
    var point: Int = 50
    private init() {}
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var pointLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pointLabel.text = String(PointManager.shared.point)
        print("뷰디드로드")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pointLabel.text = String(PointManager.shared.point)
        print("뷰윌어피어")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            print("뷰디드어피어")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("뷰윌디스어피어")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("디드디스어피어")
    }
    
    @IBAction func didTapRefresh(_ sender: UIButton) {
        pointLabel.text = String(PointManager.shared.point)
    }
}

