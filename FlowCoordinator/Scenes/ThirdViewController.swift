import UIKit

class ThirdViewController: UIViewController {
    weak var coordinator: FlowCoordinator?
    
    private lazy var firstScreen = ScreenLabel(title: "FirstViewController", color: Palettes.melon.color)
    private lazy var secondScreen = ScreenLabel(title: "SecondViewController", color: Palettes.eggshell.color)
    private lazy var thirdScreen = ScreenLabel(title: "ThirdViewController", color: Palettes.aeroBlue.color)
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.addArrangedSubview(firstScreen)
        stackView.addArrangedSubview(secondScreen)
        stackView.addArrangedSubview(thirdScreen)
        return stackView
    }()
    
    private lazy var nextButton: Button = {
        let button = Button(title: "Next")
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
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

private extension ThirdViewController {
    func configure() {
        buildViewHierarchy()
        configureViews()
        setupConstraints()
    }
    
    func buildViewHierarchy() {
        view.addSubview(stackView)
        view.addSubview(nextButton)
        view.addSubview(backButton)
    }
    
    func configureViews() {
        view.backgroundColor = .white
        title = "3rd Screen"
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
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            nextButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.42)
        ])
        
        NSLayoutConstraint.activate([
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            backButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.42)
        ])
    }
}

private extension ThirdViewController {
    @objc
    func nextButtonTapped() {
        coordinator?.fourthScreen()
    }
    
    @objc
    func backButtonTapped() {
        coordinator?.dismiss()
    }
}
