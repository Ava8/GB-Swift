//: Playground - noun: a place where people can play

import Foundation

// возможные ошибки при попытке оплатить кредиткой
enum CreditCardOperationError: Error {
    // ошибка: недостаточно средств на карте
    case insufficientFunds (moneyNeeded: Double)
    // ошибка: баланс карточки заморожен банков по каким-то причинам
    case frozenBalance
}

// вещь, которую мы хотим приобрести, имеет цену
struct thing {
    var price: Double
}


class CreditCardOperation {
    //зафиксированный лимит для этой карты
    let limit: Double = -30000
    // изначальный баланс
    var balance: Double = 0
    // состояние карты, наша карта может быть заблокирована банком
    var cardIsBlocked = false
    
    // пытаемся приобрести вещь
    func buySomethig(thing: thing)throws {
        guard cardIsBlocked == false else{
            throw CreditCardOperationError.frozenBalance
        }
        // провека на возможность позволить купить себе эту вещь
        guard thing.price <= (-limit + self.balance) else {
            //рассчитывает необходимый остаток средств на карте с учётом лимита
            if balance < 0 {
                throw CreditCardOperationError.insufficientFunds(moneyNeeded: thing.price + limit + balance)
            } else {
                throw CreditCardOperationError.insufficientFunds(moneyNeeded: thing.price + limit - balance)
            }
        }
        // списываем деньги за вещь с карты
        balance = self.balance - thing.price
    }
    
    // функция для внесения какой-либо суммы денег
    func depositeMoney (someMoney: Double) {
        balance = self.balance + someMoney
    }
    
    // функция "узнай свой баланс"
    func printBalance() {
        print ("Balance is \(balance) rub")
    }
    
    // банк может заблокировать нашу карту
    func changeCardState(cardIsBlocked: Bool) {
        switch cardIsBlocked {
        case true:
            self.cardIsBlocked = true
        case false:
            self.cardIsBlocked = false
        }
    }
}

// ключевое улучшение кода: описанияе ошибок, чтобы упростить себе жизнь и вызов docatch()
extension CreditCardOperationError: CustomStringConvertible {
    var description: String {
        switch self {
        case .insufficientFunds(let moneyNeeded): return "There is not enough money on the card to carry out this operation. Your balance: \(operation.balance) rub, indispensably: \(moneyNeeded) rub"
        case .frozenBalance: return "Your balance is frozen for some reason. For more information, please contact the Bank."
        }
    }
}


//балуемся с  нашей картой
let operation = CreditCardOperation()
do {
    try operation.buySomethig(thing: .init(price: 890.7))
} catch let error as CreditCardOperationError {
    print(error.description)
}
operation.printBalance()
operation.depositeMoney(someMoney: 10000)
operation.printBalance()
do {
    try operation.buySomethig(thing: .init(price: 70000))
} catch let error as CreditCardOperationError {
    print(error.description)
}
operation.printBalance()
do {
    try operation.buySomethig(thing: .init(price: 39109.3))
} catch let error as CreditCardOperationError {
    print(error.description)
}
operation.printBalance()

// банку не понравилось, что у нас такой отрицательный баланс и он заподозрил подозрительную активность по нашей карточке. Результат - баланс заморожен.
operation.changeCardState(cardIsBlocked: true)

// ничего не подозревая, мы пытаемся купить что-то на 90 рублей.
do {
    try operation.buySomethig(thing: .init(price: 90))
} catch let error as CreditCardOperationError {
    print(error.description)
}
