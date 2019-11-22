//
//  kAnimatedTableView.swift
//  AnimatedTableView
//
//  Created by Kedar Sukerkar on 22/11/19.
//  Copyright © 2019 Kedar Sukerkar. All rights reserved.
//

import UIKit


@IBDesignable
open class kAnimatedTableView: UITableView, UITableViewDelegate {
    
    // MARK: - Properties
    public enum kAnimatedCellAnimation:Int {
        case Fade = 1
        case MoveUpWithBounce = 2
        case Slide = 3
        case MoveUpWithFade = 4
        case MoveDownWithBounce = 5
        case MoveDownWithFade = 6
    }
    
    public var selectedCellAnimation: kAnimatedCellAnimation = .Fade
    
    
    @IBInspectable public var animate: Bool = false
    @IBInspectable public var animateDelay: Double = 0.05
    @IBInspectable public var animateDuration: Double = 1.2
    
    @IBInspectable public var animateStyle: Int {
        get {
            return selectedCellAnimation.rawValue
        }
        set (animationIndex) {
            selectedCellAnimation = kAnimatedCellAnimation(rawValue: animationIndex) ?? .Fade
        }
    }
  
    // MARK: - UIView
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        self.delegate = self
        
    }

    // MARK: - UITableViewDelegate
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        var animation: kAnimatedTableViewCellClosure
        if self.animate {
            switch self.selectedCellAnimation {
            case .Fade:
                animation = kTableViewCellAnimationFactory.makeFade(duration: self.animateDuration, delayFactor: self.animateDelay)
            case .MoveUpWithBounce:
                animation = kTableViewCellAnimationFactory.makeMoveUpWithBounce(rowHeight: cell.frame.height, duration: self.animateDuration, delayFactor: self.animateDelay)
            case .Slide:
                animation = kTableViewCellAnimationFactory.makeSlideIn(duration: self.animateDuration, delayFactor: self.animateDelay)
            case .MoveUpWithFade:
                animation = kTableViewCellAnimationFactory.makeMoveUpWithFade(rowHeight: cell.frame.height, duration: self.animateDuration, delayFactor: self.animateDelay)
            case .MoveDownWithBounce:
                animation = kTableViewCellAnimationFactory.makeMoveDownWithBounce(rowHeight: cell.frame.height, duration: self.animateDuration, delayFactor: self.animateDelay)
            case .MoveDownWithFade:
                animation = kTableViewCellAnimationFactory.makeMoveDownWithFade(rowHeight: cell.frame.height, duration: self.animateDuration, delayFactor: self.animateDelay)
            }
            let animator = kTableViewCellAnimator(animation: animation)
            animator.animate(cell: cell, at: indexPath, in: tableView)
        }
 
    }
    
}

