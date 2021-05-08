import UIKit

final class FlowCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func dismiss() {
        navigationController.popViewController(animated: true)
    }
    
    func start() {
        let controller = FirstViewController()
        controller.coordinator = self
        navigationController.pushViewController(controller, animated: true)
    }
    
    func secondScreen() {
        let controller = SecondScreenViewController()
        controller.coordinator = self
        navigationController.pushViewController(controller, animated: true)
    }
}
