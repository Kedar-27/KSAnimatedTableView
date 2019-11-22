//
//  kTableViewCellAnimator.swift
//  AnimatedTableView
//
//  Created by Kedar Sukerkar on 22/11/19.
//  Copyright © 2019 Kedar Sukerkar. All rights reserved.
//

import UIKit

final class kTableViewCellAnimator {
    
	private var hasAnimatedAllCells = false
	private let animation: kAnimatedTableViewCellClosure

	init(animation: @escaping kAnimatedTableViewCellClosure) {
		self.animation = animation
	}

	func animate(cell: UITableViewCell, at indexPath: IndexPath, in tableView: UITableView) {
		guard !hasAnimatedAllCells else {
			return
		}

		animation(cell, indexPath, tableView)

		hasAnimatedAllCells = tableView.isLastVisibleCell(at: indexPath)
	}
}
