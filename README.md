# AnimatedTableView
AnimatedTableView is the easiest and coolest way to add animations to standard UITableView

## Installation

#### Cocoapods

Feature to be added soon


#### Manually

Drag and drop contents of Sources folder directly into your project

## Usage

```swift

// create subclass of tableview as kAnimatedTableView

//set animate property of tableView to true for enabling. Default is false


//For programatic approach set cell animation style of tableview to desired value
 
 self.animatedTableView.selectedCellAnimation = kAnimatedTableView.kAnimatedCellAnimation(rawValue: sender.tag) ?? kAnimatedTableView.kAnimatedCellAnimation.Fade


public enum kAnimatedCellAnimation:Int {
    case Fade = 1
    case MoveUpWithBounce = 2
    case Slide = 3
    case MoveUpWithFade = 4
    case MoveDownWithBounce = 5
    case MoveDownWithFade = 6
}
 // set appropriate int value according to desired style



```
## Author
[Kedar Sukerkar](https://github.com/Kedar-27)


## License
[MIT](https://choosealicense.com/licenses/mit/)
