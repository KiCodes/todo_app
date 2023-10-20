import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/src/data/shared_preferences.dart';

class TodoNotifier with ChangeNotifier {
  SharedPreferencesManager sharedPreferencesManager = SharedPreferencesManager();
  final String _greetingText = 'Hi, Samuel I.';
  String get greetingText => _greetingText;
  int _navIndex = 0;
  int selectedCategoryIndex = -1;


  TextEditingController searchController = TextEditingController();
  bool _isListVisible = true;
  bool get isListVisible => _isListVisible;
  bool _isOverdue = false;
  bool get isOverdue => _isOverdue;
  bool _isNotes = false;
  bool get isNotes => _isNotes;
  bool _isFloatingPressed = false;
  bool get isFloatingPressed => _isFloatingPressed;
  bool _isTodoFilled = false;

  bool get isTodoFilled => _isTodoFilled;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int get navIndex => _navIndex;
  List<Map<String, dynamic>> todoList = [];
  List<Map<String, dynamic>> categories = [];
  List<String> tempSubTask = [];
  bool _isOneTempSubTask = false;
  bool _showTaskField = false;
  bool _isTypingSubTask = false;

  bool get isTypingSubTask => _isTypingSubTask;

  bool get showTaskField => _showTaskField;

  bool get isOneTempSubTask => _isOneTempSubTask;

  void addSubTask(String subTask) {
    tempSubTask.add(subTask);
    notifyListeners();
  }
  void removeSubTask(String subTask) {
    tempSubTask.remove(subTask);
    notifyListeners();
  }

  void setIsOneTempSubTask(bool value) {
    _isOneTempSubTask = value;
    notifyListeners();
  }
  void setIsTypingSubTask(bool value) {
    _isTypingSubTask = value;
    notifyListeners();
  }

  void setShowTaskField(bool value) {
    _showTaskField = value;
    notifyListeners();
  }

  bool isItemChecked(int index) {
    return todoList[index]['checked'];
  }

  void toggleIsTodoFilled() {
    _isTodoFilled = !_isTodoFilled;
    notifyListeners();
  }
  void toggleItemCheckState(int index) {
    todoList[index]['checked'] = !todoList[index]['checked'];
    SharedPreferencesManager.saveTodos(todoList);
    notifyListeners();
  }

  void toggleFloatButton() {
    _isFloatingPressed= !_isFloatingPressed;
    notifyListeners();
  }

  void toggleListVisibility() {
    _isListVisible = !_isListVisible;
    notifyListeners();
  }

  void toggleOverdueVisibility() {
    _isOverdue = !_isOverdue;
    notifyListeners();
  }

  void toggleNotesVisibility() {
    _isNotes = !_isNotes;
    notifyListeners();
  }

  void setNavIndex(int newValue) {
    _navIndex = newValue;
    notifyListeners();
  }

  String formatTime(DateTime time) {
    final formattedTime = DateFormat('h:mm a').format(time);
    return formattedTime;
  }

  void setSelectedCategoryIndex(int index) {
    selectedCategoryIndex = index;
    notifyListeners();
  }


}

