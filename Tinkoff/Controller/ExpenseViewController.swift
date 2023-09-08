//
//  ViewController.swift
//  Tinkoff
//
//  Created by Владимир Есаян on 06.09.2023.
//

import UIKit

class ExpenseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
 
    
    //MARK: - создание переменных
    private let viewNameLabel = UILabel()
    private let searchTextField = UITextField()
    private var expenseTableView = UITableView()
    private let identifire = "myCell"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        createTableView()
      
        //цвет view
        view.backgroundColor = .gray
        title = "Операции"
        //меняем цвет текста заголовка
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//        //меняем шрифт текста заголовка
//        let textFont = UIFont.systemFont(ofSize: 23, weight: .medium)
        //поисковая строка
        searchTextField.borderStyle = .roundedRect
        searchTextField.backgroundColor = .systemGray2
        searchTextField.placeholder = "\u{1F50D} Поиск"
    
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchTextField)
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            searchTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            searchTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    func createTableView() {
        //расположить на view,"view.bounds" используется, чтобы сделать UITableView равным по размеру главному виду
        //plain-стиль таблтцы без разделителей между ячейками
        expenseTableView = UITableView(frame: view.bounds, style: .plain)
        //"UITableViewCell.self" означает, что вы хотите зарегистрировать стандартный класс UITableViewCell для использования в вашей таблице.
        //"forCellReuseIdentifier": Это строковый идентификатор, который будет связан с этим типом ячейки
        expenseTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifire)
        //подписка на delegate
        expenseTableView.delegate = self
        //подписка на dataSource
        expenseTableView.dataSource = self
        //отключение автоматических крепежей
        expenseTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(expenseTableView)
        
        NSLayoutConstraint.activate([
            expenseTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            expenseTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            expenseTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            expenseTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1: return 5
        default:
            break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath)
        cell.textLabel?.text = "\(indexPath.section) \(indexPath.row)"
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 3
    }

    
}

