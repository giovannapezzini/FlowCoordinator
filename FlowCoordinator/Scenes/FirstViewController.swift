import UIKit

class FirstViewController: UIViewController {
    weak var coordinator: FlowCoordinator?
    
    private lazy var firstScreen = ScreenLabel(title: "FirstViewController", color: Palettes.melon.color)
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(firstScreen)
        return stackView
    }()
    
    private lazy var nextButton: Button = {
        let button = Button(title: "Next")
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

private extension FirstViewController {
    func configure() {
        buildViewHierarchy()
        configureViews()
        setupConstraints()
    }
    
    func buildViewHierarchy() {
        view.addSubview(stackView)
        view.addSubview(nextButton)
    }
    
    func configureViews() {
        view.backgroundColor = .white
        title = "1st Screen"
        navigationController?.navigationBar.prefersLargeTitles = true
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
    }
}

private extension FirstViewController {
    @objc
    func nextButtonTapped() {
        coordinator?.secondScreen()
    }
}
