import UIKit

class ScreenLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String, color: UIColor) {
        self.init(frame: .zero)
        text = title
        backgroundColor = color
    }
    
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .black
        textAlignment = .center
        layer.cornerRadius = 12
        layer.masksToBounds = true
    }
    
    func constraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 70)
        ])
    }
}
