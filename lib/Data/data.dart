

import 'dart:math';

import 'package:profileapp/Models/category_model.dart';
import 'package:profileapp/Models/expense_model.dart';

final rand = Random();
final List<double> weeklySpending = [
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
];
_generateExpenses(){
  List<Expense> expenses =[
    Expense(name: 'Item 0',cost: rand.nextDouble()*90),
    Expense(name: 'Item 1',cost: rand.nextDouble()*90),
    Expense(name: 'Item 2',cost: rand.nextDouble()*90),
    Expense(name: 'Item 3',cost: rand.nextDouble()*90),
    Expense(name: 'Item 4',cost: rand.nextDouble()*90),
    Expense(name: 'Item 5',cost: rand.nextDouble()*90),
   // Expense(name: 'Item 6',cost: rand.nextDouble()*90),
  ];
  return expenses;
}
List<Category> categories = [
  Category(name: 'Food',maxAmount: 450,expense: _generateExpenses()),
  Category(name: 'Clothing',maxAmount: 500,expense: _generateExpenses()),
  Category(name: 'Utilities',maxAmount: 600,expense: _generateExpenses()),
  Category(name: 'Entertainment',maxAmount: 330,expense: _generateExpenses()),
  Category(name: 'Transportation',maxAmount: 500,expense: _generateExpenses()),
  Category(name: 'Housing',maxAmount: 1000,expense: _generateExpenses()),
];