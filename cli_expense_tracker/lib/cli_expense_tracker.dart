import 'dart:io';

// ======================
// Extension Method
// ======================

extension CurrencyFormatter on double {
  String toCurrency() => "৳${toStringAsFixed(2)}";
}

// ======================
// Base Class
// ======================

class Expense {
  String title;
  double amount;
  String category;

  Expense(this.title, this.amount, this.category);

  void display() {
    print("$title - ${amount.toCurrency()} - $category");
  }
}

// ======================
// Child Classes
// ======================

class FoodExpense extends Expense {
  FoodExpense(String title, double amount) : super(title, amount, "Food");

  @override
  void display() {
    print("$title - ${amount.toCurrency()} - Food");
  }
}

class TransportExpense extends Expense {
  TransportExpense(String title, double amount)
    : super(title, amount, "Transport");

  @override
  void display() {
    print("$title - ${amount.toCurrency()} - Transport");
  }
}

class EntertainmentExpense extends Expense {
  EntertainmentExpense(String title, double amount)
    : super(title, amount, "Entertainment");

  @override
  void display() {
    print("$title - ${amount.toCurrency()} - Entertainment");
  }
}

// ======================
// Main Program
// ======================

void main() {
  List<Expense> expenses = [];

  while (true) {
    print('''

===== Expense Tracker =====

1. Add Expense
2. View All Expenses
3. Show Total Expenses
4. Exit

Choose Option:
''');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        addExpense(expenses);
        break;

      case "2":
        viewExpenses(expenses);
        break;

      case "3":
        showTotal(expenses);
        break;

      case "4":
        print("\nThank you for using Expense Tracker!");
        return;

      default:
        print("\nInvalid Option!\n");
    }
  }
}

// ======================
// Add Expense
// ======================

void addExpense(List<Expense> expenses) {
  print("\nEnter Expense Title:");
  String title = stdin.readLineSync()!;

  print("Enter Expense Amount:");
  double amount = double.parse(stdin.readLineSync()!);

  print("Enter Category (Food / Transport / Entertainment):");
  String category = stdin.readLineSync()!;

  Expense expense;

  switch (category.toLowerCase()) {
    case "food":
      expense = FoodExpense(title, amount);
      break;

    case "transport":
      expense = TransportExpense(title, amount);
      break;

    case "entertainment":
      expense = EntertainmentExpense(title, amount);
      break;

    default:
      expense = Expense(title, amount, category);
  }

  expenses.add(expense);

  print("\nExpense Added Successfully!\n");
}

// ======================
// View Expenses
// ======================

void viewExpenses(List<Expense> expenses) {
  if (expenses.isEmpty) {
    print("\nNo expenses found.\n");
    return;
  }

  print("\n===== All Expenses =====\n");

  for (int i = 0; i < expenses.length; i++) {
    print("${i + 1}. ");
    expenses[i].display();
  }
}

// ======================
// Total Expenses
// ======================

void showTotal(List<Expense> expenses) {
  double total = 0;

  for (var expense in expenses) {
    total += expense.amount;
  }

  print("\nTotal Expenses: ${total.toCurrency()}\n");
}
