//
//  ExpensesCell.swift
//  Tinkoff
//
//  Created by Владимир Есаян on 08.09.2023.
//
import UIKit
// MARK: - create ExpensesCell class
class ExpensesCell: UITableViewCell {
    // создание элементов ячейки
    // иконка трат
    let expenseImageView = UIImageView()
    // имя трат
    let expenseTitleLabel = UILabel()
    // сумма трат
    let expenseSumLabel = UILabel()
    // вид трат
    let expenseKindLabel = UILabel()
    // счет списанния
    let accountLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // добавляем на view элементы
        addSubview(expenseImageView)
        addSubview(expenseTitleLabel)
        addSubview(expenseSumLabel)
        addSubview(expenseKindLabel)
        addSubview(accountLabel)
        backgroundColor = .darkGray
        
        // MARK: - sets (функции настройки элементов для cell)
        configureImageView()
        configureTitleLabel()
        configureSumLabel()
        configureKindLabel()
        configureAccountLabel()
        setConstraits()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // функция выполняет задачу обновления интерфейсных элементов на экране информацией из объекта Expense, переданного в качестве параметра
    func set(expense: Expense) {
        expenseImageView.image = expense.image
        expenseTitleLabel.text = expense.title
        expenseSumLabel.text   = expense.sum
        expenseKindLabel.text  = expense.kind
        accountLabel.text      = expense.account
    }
    
    // MARK: - configures
    // настройки изображения
    func configureImageView() {
        // устанавливает радиус скругления углов
        expenseImageView.layer.cornerRadius = 25
        // содержимое контейнера будет отображаться только в пределах его рамок, отсекая все, что находится за его пределами
        expenseImageView.clipsToBounds = true
        expenseImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // настройки надписи
    func configureTitleLabel() {
        // количество линий будет рассчитываться динамически в зависимости от содержимого и доступного пространства в ячейке
        expenseTitleLabel.numberOfLines = 0
        // цвет текста
        expenseTitleLabel.textColor = .white
        // шрифт
        expenseTitleLabel.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        // позволяет автоматически уменьшать размер шрифта для соответствия доступному пространству и избежания усечения текста
        expenseTitleLabel.adjustsFontSizeToFitWidth = true
        expenseTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // настройка надписи суммы денег
    func configureSumLabel() {
        // количество линий будет рассчитываться динамически в зависимости от содержимого и доступного пространства в ячейке
        expenseSumLabel.numberOfLines = 0
        // цвет текста
        expenseSumLabel.textColor = .white
        // позволяет автоматически уменьшать размер шрифта для соответствия доступному пространству и избежания усечения текста
        expenseSumLabel.adjustsFontSizeToFitWidth = true
        expenseSumLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // настроки надписи вида трат
    func configureKindLabel() {
        // количество линий будет рассчитываться динамически в зависимости от содержимого и доступного пространства в ячейке
        expenseKindLabel.numberOfLines = 0
        // цвет текста
        expenseKindLabel.textColor = .white
        // шрифт
        expenseKindLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        // позволяет автоматически уменьшать размер шрифта для соответствия доступному пространству и избежания усечения текста
        expenseKindLabel.adjustsFontSizeToFitWidth = true
        expenseKindLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // настройка надписи счета списания
    func configureAccountLabel() {
        // количество линий будет рассчитываться динамически в зависимости от содержимого и доступного пространства в ячейке
        accountLabel.numberOfLines = 0
        // цвет текста
        accountLabel.textColor = .white
        // шрифт
        accountLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        // позволяет автоматически уменьшать размер шрифта для соответствия доступному пространству и избежания усечения текста
        accountLabel.adjustsFontSizeToFitWidth = true
        accountLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - constraits
    
    func setConstraits() {
        NSLayoutConstraint.activate([
            expenseImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            expenseImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            expenseImageView.heightAnchor.constraint(equalToConstant: 50),
            expenseImageView.widthAnchor.constraint(equalToConstant: 50),
            
            expenseTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            expenseTitleLabel.leadingAnchor.constraint(equalTo: expenseImageView.leadingAnchor, constant: 60),
            expenseTitleLabel.bottomAnchor.constraint(equalTo: topAnchor, constant: 30),
            
            expenseKindLabel.topAnchor.constraint(equalTo: expenseTitleLabel.topAnchor,constant: 30),
            expenseKindLabel.leadingAnchor.constraint(equalTo: expenseImageView.leadingAnchor, constant: 60),
            
            expenseSumLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            expenseSumLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            accountLabel.topAnchor.constraint(equalTo: expenseSumLabel.topAnchor, constant: 30),
            accountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
}
