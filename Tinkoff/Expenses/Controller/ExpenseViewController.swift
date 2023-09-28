//
//  ViewController.swift
//  Tinkoff
//
//  Created by Владимир Есаян on 06.09.2023.
//

import UIKit

class ExpenseViewController: UIViewController {
    // MARK: - инициализация UI
    private let searchTextField = UITextField()
    private var expenseTableView = UITableView()
    // создание идентивикатора
    private let identifire = "ExpensesCell"
    private var expenses: [Expense] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // изменение цвета
        view.backgroundColor = .darkGray
        title = "Операции"
        // меняем цвет текста заголовка
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        congigureTableView()
        setTableViewDelegates()
        createSearch()
        // приравняли массивы
        expenses = fetchData()
        
    }
    
    // создание поисковой строки
    func createSearch() {
        // поисковая строка
        // скругление поисковой строки
        searchTextField.borderStyle = .roundedRect
        searchTextField.backgroundColor = .systemGray
        // добавление лупы в placeholder в виде эмодзи
        searchTextField.placeholder = "\u{1F50D} Поиск"
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchTextField)
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            searchTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            searchTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    // MARK: - TableVIew (настройки)
    func congigureTableView() {
        // расположить на view,"view.bounds" используется, чтобы сделать UITableView равным по размеру главному виду
        // plain-стиль таблтцы без разделителей между ячейками
        expenseTableView = UITableView(frame: view.bounds, style: .plain)
        // "UITableViewCell.self" означает, что вы хотите зарегистрировать стандартный класс UITableViewCell для использования в вашей таблице.
        // "forCellReuseIdentifier": Это строковый идентификатор, который будет связан с этим типом ячейки
        expenseTableView.register(ExpensesCell.self, forCellReuseIdentifier: identifire)
        // высота строк в таблице
        expenseTableView.rowHeight = 90
        // отключение автоматических ограничения
        expenseTableView.translatesAutoresizingMaskIntoConstraints = false
        // добавялем на view
        view.addSubview(expenseTableView)
        // set constraits
        NSLayoutConstraint.activate([
            expenseTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
            expenseTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            expenseTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            expenseTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // функция с установкой подписки на delegates
    func setTableViewDelegates() {
        // подписка на delegate и dataSource
        expenseTableView.delegate = self
        expenseTableView.dataSource = self
    }
}

// MARK: - extensions for ExpenseViewController
extension ExpenseViewController: UITableViewDelegate, UITableViewDataSource {
    
    // функция для отображения количества строк на экране
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // возвращает количество элементов в массиве
        return expenses.count
    }
    
    // настройка вида самой строки в таблице (каждый раз строка вызывается на экран, как только она находится в видимой части)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // создание cell(Метод dequeueReusableCell(withIdentifier:) вызывается на объекте tableView для получения переиспользуемой ячейки с определенным идентификатором (identifire). Этот идентификатор связан с определенным типом ячейки. Затем, с помощью оператора as!, результат этого вызова приводится к типу ExpensesCell, предполагая, что ячейка имеет этот тип. Если приведение типа не удается, это может вызвать сбой приложения, поэтому используется оператор as!, предполагая, что типы совпадают.)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire) as! ExpensesCell
        // получается объект расхода (Expense) из массива expenses на основе индекса строки (indexPath.row). indexPath.row указывает на текущую позицию в таблице
        let expense = expenses[indexPath.row]
        // вызывается метод set(expense:) на объекте cell для настройки ячейки данными из объекта expense. Этот метод устанавливает значения для различных подвидов (subviews) ячейки на основе данных о расходе.
        cell.set(expense: expense)
        
        return cell
    }
}

// MARK: - создание базы данных
extension ExpenseViewController{
    
    // функция не принимает аргументов и возвращает массив типа Expense (структура в модели)
    func fetchData() -> [Expense] {
        let expense1   = Expense(image: Images.health, title: "Формула здоровья", sum: "-123,50", kind: "Аптеки", account: "дебетовая карта")
        let expense2   = Expense(image: Images.shopping, title: "SPAR", sum: "-79,99", kind: "Супермаркеты", account: "дебетовая карта")
        let expense3   = Expense(image: Images.replenishment, title: "Алексей Ф.", sum: "-450", kind: "переводы", account: "Tinkoff Black")
        let expense4   = Expense(image: Images.shopping, title: "METRO Cash&Carry", sum: "-545", kind: "Супермаркеты", account: "дебетовая карта")
        let expense5   = Expense(image: Images.replenishment, title: "Андрей М.", sum: "-3500", kind: "Переводы" , account: "дебетовая карта")
        let expense6   = Expense(image: Images.shopping, title: "Магазин Матрешка", sum: "-340", kind: "Супермаркеты", account: "Tinkoff Black")
        let expense7   = Expense(image: Images.bills, title: "Плата за обслуживание", sum: "-99", kind: "Услуги банка", account: "дебетовая карта")
        let expense8   = Expense(image: Images.fastFood, title: "Myasnaya tema", sum: "-320", kind: "Фастфуд", account: "Tinkoff Black")
        let expense9   = Expense(image: Images.shopping, title: "ситиМаркет", sum: "-248", kind: "Супермаркеты", account: "дебетовая карта")
        let expense10  = Expense(image: Images.fastFood, title: "Кафе", sum: "-320", kind: "Фастфуд", account: "Tinkoff Black")
        let expense11  = Expense(image: Images.shopping, title: "ситиМаркет", sum: "-248", kind: "Супермаркеты", account: "дебетовая карта")
        let expense12  = Expense(image: Images.fastFood, title: "Вкусно - и точка", sum: "-320", kind: "Фастфуд", account: "Tinkoff Black")
        let expense13  = Expense(image: Images.bills, title: "Плата за обслуживание", sum: "-99", kind: "Услуги банка", account: "дебетовая карта")
        let expense14  = Expense(image: Images.shopping, title: "Магазин Матрешка", sum: "-340", kind: "Супермаркеты", account: "Tinkoff Black")
        let expense15  = Expense(image: Images.replenishment, title: "Виктор П.", sum: "+500", kind: "Пополнение" , account: "дебетовая карта")
        
        return [expense1, expense2, expense3, expense4, expense5, expense6,expense7, expense8, expense9, expense10,expense11, expense12, expense13,expense14, expense15]
    }
}
