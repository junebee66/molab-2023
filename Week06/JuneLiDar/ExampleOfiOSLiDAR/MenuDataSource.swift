

import UIKit

struct MenuItem {
    let title: String
    let description: String
    let prefix: String
    
    func viewController() -> UIViewController {
        let storyboard = UIStoryboard(name: prefix, bundle: nil)
        let vc = storyboard.instantiateInitialViewController()!
        vc.title = title

        return vc
    }
}

class MenuViewModel {
    private let dataSource = [
        MenuItem (
            title: "🗺️ Depth Map",
            description: "Display the depth map on the screen",
            prefix: "DepthMap"
        ),
        MenuItem (
            title: "🎱 Collision",
            description: "collision balls",
            prefix: "Collision"
        ),
        MenuItem (
            title: "🍀 Point Cloud",
            description: "Point cloud.",
            prefix: "PointCloud"
        )
    ]
    
    var count: Int {
        dataSource.count
    }
    
    func item(row: Int) -> MenuItem {
        dataSource[row]
    }
    
    func viewController(row: Int) -> UIViewController {
        dataSource[row].viewController()
    }
}
