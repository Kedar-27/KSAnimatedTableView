//
//  kTableViewCellAnimations.swift
//  AnimatedTableView
//
//  Created by Kedar Sukerkar on 22/11/19.
//  Copyright © 2019 Kedar Sukerkar. All rights reserved.
//

import UIKit

typealias kAnimatedTableViewCellClosure = (UITableViewCell, IndexPath, UITableView) -> Void

enum kTableViewCellAnimationFactory {

	static func makeFade(duration: TimeInterval, delayFactor: Double) -> kAnimatedTableViewCellClosure {
		return { cell, indexPath, _ in
			cell.alpha = 0

			UIView.animate(
				withDuration: duration,
				delay: delayFactor * Double(indexPath.row),
				animations: {
					cell.alpha = 1
			})
		}
	}

	static func makeMoveUpWithBounce(rowHeight: CGFloat, duration: TimeInterval, delayFactor: Double) -> kAnimatedTableViewCellClosure {
		return { cell, indexPath, tableView in
			cell.transform = CGAffineTransform(translationX: 0, y: rowHeight)

			UIView.animate(
				withDuration: duration,
				delay: delayFactor * Double(indexPath.row),
				usingSpringWithDamping: 0.4,
				initialSpringVelocity: 0.1,
				options: [.curveEaseInOut],
				animations: {
					cell.transform = CGAffineTransform(translationX: 0, y: 0)
			})
		}
	}

	static func makeSlideIn(duration: TimeInterval, delayFactor: Double) -> kAnimatedTableViewCellClosure {
		return { cell, indexPath, tableView in
			cell.transform = CGAffineTransform(translationX: tableView.bounds.width, y: 0)

			UIView.animate(
				withDuration: duration,
				delay: delayFactor * Double(indexPath.row),
				options: [.curveEaseInOut],
				animations: {
					cell.transform = CGAffineTransform(translationX: 0, y: 0)
			})
		}
	}

	static func makeMoveUpWithFade(rowHeight: CGFloat, duration: TimeInterval, delayFactor: Double) -> kAnimatedTableViewCellClosure {
		return { cell, indexPath, tableView in
			cell.transform = CGAffineTransform(translationX: 0, y: rowHeight / 2)
			cell.alpha = 0

			UIView.animate(
				withDuration: duration,
				delay: delayFactor * Double(indexPath.row),
				options: [.curveEaseInOut],
				animations: {
					cell.transform = CGAffineTransform(translationX: 0, y: 0)
					cell.alpha = 1
			})
		}
	}
    
    static func makeMoveDownWithFade(rowHeight: CGFloat, duration: TimeInterval, delayFactor: Double) -> kAnimatedTableViewCellClosure {
        return { cell, indexPath, tableView in
            cell.transform = CGAffineTransform(translationX: 0, y: 0)
            cell.alpha = 0

            UIView.animate(
                withDuration: duration,
                delay: delayFactor * Double(indexPath.row),
                options: [.curveEaseInOut],
                animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: rowHeight / 2)
                    cell.alpha = 1
            })
        }
    }
    
  static func makeMoveDownWithBounce(rowHeight: CGFloat, duration: TimeInterval, delayFactor: Double) -> kAnimatedTableViewCellClosure {
        return { cell, indexPath, tableView in
            cell.transform = CGAffineTransform(translationX: 0, y: 0)

            UIView.animate(
                withDuration: duration,
                delay: delayFactor * Double(indexPath.row),
                usingSpringWithDamping: 0.4,
                initialSpringVelocity: 0.1,
                options: [.curveEaseInOut],
                animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: rowHeight)
            })
        }
    }
    
    
}
