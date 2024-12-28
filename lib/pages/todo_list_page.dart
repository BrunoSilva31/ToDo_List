// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/widgets/todo_list_item.dart';

class ToDoListPage extends StatefulWidget {
  ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  
  List<Todo> todo = [];

  final TextEditingController todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
          body: Center(
      
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
      
                mainAxisSize: MainAxisSize.min,
                
                children: [
                  Row(
                    
                    children: [
                      
                      Expanded( 
                        child: TextField(
                          controller: todoController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Adicione uma tarefa',
                            hintText: 'Ex: Estudar Flutter'
                          ),
                        ),
                      ),
                  
                      SizedBox(width: 8),
                  
                      ElevatedButton(onPressed: (){
                        String text = todoController.text;
      
                        setState(() {
                          Todo newTodo = Todo (
                            title: text,
                            date: DateTime.now(),
                          );
                          todo.add(newTodo);
                        });
      
                        todoController.clear();
      
                      },
      
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 24, 128, 255),
                        padding: EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                  
                       child: Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.white,
                       ),
                      ),
                    ],
                  ),
      
      
                SizedBox(height: 16),
                
                Flexible(
                  
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      
                      for(Todo item in todo)
                        TodoListItem(
                          todo: item,
                        ),
                  
                    ],
                  ),
                ),
      
                  SizedBox(height: 16),
      
                  Row(
                    
                    children: [
                      Expanded(
                        child: Text(
                          'Você possui ${todo.length} tarefas pendentes',
                        ),
                      ),
      
                      ElevatedButton(onPressed: (){},
                        style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 24, 128, 255),
                        padding: const EdgeInsets.all(16), 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        ),
      
                      child: 
                        Text(
                        'Limpar tudo',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      
                      ),
                    ],
                  ),
      
      
                ],
              ),
            ),
          ),
        ),
    );
  }
}