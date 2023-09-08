//
//  ViewController.swift
//  Tinkoff
//
//  Created by Владимир Есаян on 06.09.2023.
//

import UIKit

class ExpenseViewController: UIViewController {
    //MARK: - создание переменных
    private let viewNameLabel = UILabel()
    private let searchTextField = UITextField()
    private var expenseTableView = UITableView()
    private let identifire = "ExpensesCell"
    private var expenses: [Expense] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .gray
        title = "Операции"
        //меняем цвет текста заголовка
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        //        //меняем шрифт текста заголовка
        //        let textFont = UIFont.systemFont(ofSize: 23, weight: .medium)
        createTableView()
        createSearch()
        expenses = fetchData()
        
    }
    func createSearch() {
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
        expenseTableView.register(ExpensesCell.self, forCellReuseIdentifier: identifire)
        //подписка на delegate
        expenseTableView.delegate = self
        //подписка на dataSource
        expenseTableView.dataSource = self
        //высота строк
        expenseTableView.rowHeight = 90
        //отключение автоматических крепежей
        expenseTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(expenseTableView)
        
        NSLayoutConstraint.activate([
            expenseTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
            expenseTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            expenseTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            expenseTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
extension ExpenseViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire) as! ExpensesCell
        let expense = expenses[indexPath.row]
        cell.set(expense: expense)
        
        return cell
    }
}
//создание базы данных
extension ExpenseViewController{
    func fetchData() -> [Expense] {
        let expense1  = Expense(image: Images.health, title: "Аптека", sum: "-123,50", kind: "Аптеки", account: "дебетовая карта")
        let expense2  = Expense(image: Images.shopping, title: "SPAR", sum: "-79.99", kind: "Супермаркеты", account: "дебетовая карта")
        let expense3  = Expense(image: Images.transaction, title: "Алексей Ф.", sum: "-450", kind: "переводы", account: "Tinkoff Black")
        let expense4  = Expense(image: Images.shopping, title: "METRO Cash&Carry", sum: "-545", kind: "Супермаркеты", account: "дебетовая карта")
        let expense5  = Expense(image: Images.replenishment, title: "Андрей М.", sum: "-3500", kind: "Переводы" , account: "дебетовая карта")
        let expense6  = Expense(image: Images.shopping, title: "Магазин Матрешка", sum: "-340", kind: "Супермаркеты", account: "Tinkoff Black")
        let expense7  = Expense(image: Images.bills, title: "Плата за обслуживание", sum: "-99", kind: "Услуги банка", account: "дебетовая карта")
        let expense8  = Expense(image: Images.shopping, title: "Myasnaya tema", sum: "-320", kind: "Фастфуд", account: "Tinkoff Black")
        let expense9  = Expense(image: Images.shopping, title: "ситиМаркет", sum: "-248", kind: "Супермаркеты", account: "дебетовая карта")
        let expense10 = Expense(image: Images.shopping, title: "Кафе", sum: "-320", kind: "Фастфуд", account: "Tinkoff Black")
        let expense11 = Expense(image: Images.shopping, title: "Кафе", sum: "-320", kind: "Фастфуд", account: "Tinkoff Black")
        let expense12  = Expense(image: Images.shopping, title: "ситиМаркет", sum: "-248", kind: "Супермаркеты", account: "дебетовая карта")
        let expense13  = Expense(image: Images.shopping, title: "Myasnaya tema", sum: "-320", kind: "Фастфуд", account: "Tinkoff Black")
        let expense14  = Expense(image: Images.bills, title: "Плата за обслуживание", sum: "-99", kind: "Услуги банка", account: "дебетовая карта")
        let expense15  = Expense(image: Images.shopping, title: "Магазин Матрешка", sum: "-340", kind: "Супермаркеты", account: "Tinkoff Black")
        let expense16  = Expense(image: Images.replenishment, title: "Виктор П.", sum: "500", kind: "Пополнение" , account: "дебетовая карта")
        
        return [expense1, expense2, expense3, expense4, expense5, expense6,expense7, expense8, expense9, expense10,expense11, expense12, expense13,expense14, expense15, expense16]
    }
}
