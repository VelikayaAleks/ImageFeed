
import UIKit

final class  ProfileViewController: UIViewController {
    
    private var profileImage = UIImage()
    private var userName = UILabel()
    private var login = UILabel()
    private var descriptionLabel = UILabel()
    private var exitButton = UIButton()
    private let imageView = UIImageView(image: .profile)
    
    override func viewDidLoad() {
        view.backgroundColor  = UIColor(named: "YPBlack")
        profile()
        exitB()
        label()
        
    }
    
    private func profile() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
    private func exitB() {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Exit"), for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        button.tintColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        button.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        
        button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    
    private func label() {
        userName.text = "Екатерина Новикова"
        userName.textColor = .white
        userName.font = .systemFont(ofSize: 23, weight: .bold)
        
        login.text = "@ekaterina_nov"
        login.textColor = UIColor(named: "YPGray")
        login.font = .systemFont(ofSize: 13, weight: .regular)
        
        descriptionLabel.text = "Hello, world!"
        descriptionLabel.textColor = .white
        descriptionLabel.font = .systemFont(ofSize: 13, weight: .regular)
        
        [userName, login, descriptionLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        
        userName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        userName.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        
        login.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        login.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 8).isActive = true
        
        descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: login.bottomAnchor, constant: 8).isActive = true
    }
    
    @objc
    private func didTapButton() {
        for view in view.subviews {
            if view is UILabel {
                view.removeFromSuperview()
            }
        }
    }
}
