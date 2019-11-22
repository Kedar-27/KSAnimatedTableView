//
//  kAnimatedTableViewCellVC.swift
//  AnimatedTableView
//
//  Created by Kedar Sukerkar on 22/11/19.
//  Copyright © 2019 Kedar Sukerkar. All rights reserved.
//

import UIKit

class kAnimatedTableViewCellVC: UIViewController {
    
    // MARK: - Constants
    static let storyboardIdentifier = "ILAnimatedTableViewCellVC"
    static let storyboardName       = "TableViewAnimation"
    
    // MARK: - Outlets
    @IBOutlet weak var animatedTableView: kAnimatedTableView!
    @IBOutlet var animationStyleButtonOutletCollection: [UIButton]!
    
    // MARK: - Properties
    var randomColorArray = [UIColor]()
    
    
    // MARK: - Data Injections
    
    
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupUI()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.view.endEditing(true)
    }
    
    func setupVC(){
        
        self.animatedTableView.dataSource = self
        
        
        for _ in 0...25{
            self.randomColorArray.append(.random())
        }
        
        
        
    }
    
    func setupUI(){
        
        
    }
    
    // MARK: - IBActions
    @IBAction func onRefresh(_ sender: UIBarButtonItem) {
        self.animatedTableView.reloadData()
    }
    
    @IBAction func styleButtonClicked(_ sender: UIButton) {
        self.animatedTableView.selectedCellAnimation = kAnimatedTableView.kAnimatedCellAnimation(rawValue: sender.tag) ?? kAnimatedTableView.kAnimatedCellAnimation.Fade
    
    }
    
    
    
    
    
}

extension kAnimatedTableViewCellVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.randomColorArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell(style: .default, reuseIdentifier: "cell")
            }
            return cell
        }()
        
        cell.backgroundColor = self.randomColorArray[indexPath.row]
        
        return cell
    }

}


extension UIColor {
  static func random () -> UIColor {
    return UIColor(
      red: CGFloat.random(in: 0...1),
      green: CGFloat.random(in: 0...1),
      blue: CGFloat.random(in: 0...1),
      alpha: 1.0)
  }
}
