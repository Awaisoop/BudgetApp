import 'package:profileapp/Models/expense_model.dart';

class Category{
  final String name;
  final double maxAmount;
  final List<Expense> expense;
  Category({this.name,this.expense,this.maxAmount});
}