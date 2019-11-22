//
//  UITableView+Ext.swift
//  AnimatedTableView
//
//  Created by Kedar Sukerkar on 22/11/19.
//  Copyright © 2019 Kedar Sukerkar. All rights reserved.
//

import UIKit

extension UITableView {
	func isLastVisibleCell(at indexPath: IndexPath) -> Bool {
		guard let lastIndexPath = indexPathsForVisibleRows?.last else {
			return false
		}
		return lastIndexPath == indexPath
	}
    
}

