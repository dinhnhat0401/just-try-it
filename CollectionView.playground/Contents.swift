//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

//class MyViewController : UIViewController {
//    override func loadView() {
//        let view = UIView()
//        view.backgroundColor = .white
//
//        let label = UILabel()
//        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
//        label.text = "Hello World!"
//        label.textColor = .black
//
//        view.addSubview(label)
//        self.view = view
//    }
//}

class Test1UICollectionViewCell: UICollectionViewCell {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    var name: String
}

class MyUICollectionViewController: UICollectionViewController {
    override func viewDidLoad() {

    }
}

/// UICollectionViewDelegate
extension MyUICollectionViewController {

}

/// UICollectionViewDataSource
extension MyUICollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func cellForItem(at indexPath: IndexPath) -> UICollectionViewCell? {

    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
