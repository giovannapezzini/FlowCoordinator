import UIKit

class SecondViewController: UIViewController {
    weak var coordinator: FlowCoordinator?
    
    private lazy var screenNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SecondScreen"
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 1.00, green: 0.90, blue: 0.85, alpha: 1.00)
        label.layer.cornerRadius = 12
        label.layer.masksToBounds = true
        return label
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(red: 0.85, green: 0.89, blue: 0.86, alpha: 1.00)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(red: 0.86, green: 0.90, blue: 0.87, alpha: 1.00)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

private extension SecondViewController {
    func configure() {
        buildViewHierarchy()
        configureViews()
        setupConstraints()
    }
    
    func buildViewHierarchy() {
        view.addSubview(screenNameLabel)
        view.addSubview(nextButton)
        view.addSubview(backButton)
    }
    
    func configureViews() {
        view.backgroundColor = .white
        title = "2nd Screen"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.hidesBackButton = true
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            screenNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            screenNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            screenNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            screenNameLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
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

private extension SecondViewController {
    @objc
    func nextButtonTapped() {
        coordinator?.secondScreen()
    }
    
    @objc
    func backButtonTapped() {
        coordinator?.dismiss()
    }
}
