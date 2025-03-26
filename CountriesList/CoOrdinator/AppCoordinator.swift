import UIKit

class AppCoordinator {
    var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        let viewModel = CountriesViewModel()
        let countriesVC = CountriesViewController(viewModel: viewModel, coordinator: self)
        navigationController.viewControllers = [countriesVC]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
