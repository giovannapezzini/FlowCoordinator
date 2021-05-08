import UIKit

class FourthViewController: UIViewController {
    weak var coordinator: FlowCoordinator?
    
    private lazy var firstScreen = ScreenLabel(title: "FirstViewController", color: Palettes.melon.color)
    private lazy var secondScreen = ScreenLabel(title: "SecondViewController", color: Palettes.eggshell.color)
    private lazy var thirdScreen = ScreenLabel(title: "ThirdViewController", color: Palettes.aeroBlue.color)
    private lazy var fourthScreen = ScreenLabel(title: "FourthViewController", color: Palettes.powderBlue.color)
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.addArrangedSubview(firstScreen)
        stackView.addArrangedSubview(secondScreen)
        stackView.addArrangedSubview(thirdScreen)
        stackView.addArrangedSubview(fourthScreen)
        return stackView
    }()
    
    private lazy var backButton: Button = {
        let button = Button(title: "Back")
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

private extension FourthViewController {
    func configure() {
        buildViewHierarchy()
        configureViews()
        setupConstraints()
    }
    
    func buildViewHierarchy() {
        view.addSubview(stackView)
        view.addSubview(backButton)
    }
    
    func configureViews() {
        view.backgroundColor = .white
        title = "4rth Screen"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.hidesBackButton = true
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            backButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.42)
        ])
    }
}

private extension FourthViewController {
    @objc
    func backButtonTapped() {
        coordinator?.dismiss()
    }
}
