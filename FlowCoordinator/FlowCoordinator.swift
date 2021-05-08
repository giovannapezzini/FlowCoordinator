import UIKit

final class FlowCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func dismiss() {
        navigationController.popViewController(animated: false)
    }
    
    func start() {
        let controller = FirstViewController()
        controller.coordinator = self
        navigationController.pushViewController(controller, animated: false)
    }
    
    func secondScreen() {
        let controller = SecondViewController()
        controller.coordinator = self
        navigationController.pushViewController(controller, animated: false)
    }
    
    func thirdScreen() {
        let controller = ThirdViewController()
        controller.coordinator = self
        navigationController.pushViewController(controller, animated: false)
    }
    
    func fourthScreen() {
        let controller = FourthViewController()
        controller.coordinator = self
        navigationController.pushViewController(controller, animated: false)
    }
}
