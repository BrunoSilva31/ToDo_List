// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/repositories/todo_repository.dart';
import 'package:todo_list/widgets/todo_list_item.dart';

class ToDoListPage extends StatefulWidget {
  ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  
  List<Todo> todos = [];
  Todo? deletedTodo;
  int? deleteTodoPos;

  String? errorText;

  @override
  void initState() {
    super.initState();

    todoRepository.getTodoList().then((value) {
      setState(() {
        todos = value;
      });
    });
  }


  final TextEditingController todoController = TextEditingController();
  final TodoRepository todoRepository = TodoRepository();

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
                            hintText: 'Ex: Estudar Flutter',
                            errorText: errorText,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromARGB(255, 24, 128, 255),
                              width: 2,
                              ),
                            ),

                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 24, 128, 255),
                            ),
                          ),
                        ),
                      ),
                  
                      SizedBox(width: 8),
                  
                      ElevatedButton(onPressed: (){
                        String text = todoController.text;

                        if(text.isEmpty){
                          setState(() {
                            errorText = 'A tarefa não pode estar vazia!';
                          });
                          
                          return;
                        }
      
                        setState(() {
                          Todo newTodo = Todo (
                            title: text,
                            dateTime: DateTime.now(),
                          );
                          todos.add(newTodo);
                          errorText = null;
                        });
      
                        todoController.clear();
                        todoRepository.saveTodoList(todos);
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
                      
                      for(Todo todo in todos)
                        TodoListItem(
                          todo: todo,
                          onDelete: onDelete,
                        ),
                  
                    ],
                  ),
                ),
      
                  SizedBox(height: 16),
      
                  Row(
                    
                    children: [
                      Expanded(
                        child: Text(
                          'Você possui ${todos.length} tarefa(s) pendente(s)',
                        ),
                      ),
      
                      ElevatedButton(
                        onPressed: showDeleteTodosConfirmationDialog,
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
  
  void onDelete (Todo todo) {
    deletedTodo = todo;
    deleteTodoPos = todos.indexOf(todo);

    setState(() {
      todos.remove(todo);
    });
    todoRepository.saveTodoList(todos);

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Tarefa ${todo.title} foi removida com sucesso!', style: TextStyle(
        color: Colors.white,
        ),
      ),
      backgroundColor: Colors.black,

      action: SnackBarAction(
        label: 'Desfazer',
        textColor: const Color.fromARGB(255, 24, 128, 255),
        onPressed: (){
          setState(() {
            todos.insert(deleteTodoPos!, deletedTodo!);
          });
          todoRepository.saveTodoList(todos);

        },
      ),
      ),
    );
  }

  void showDeleteTodosConfirmationDialog() {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text('Limpar tudo?'),
        content: Text('Tem certeza?'),
        actions: [
          TextButton(
            onPressed: (){
              Navigator.of(context).pop();
            }, 
            
            style: TextButton.styleFrom(foregroundColor: Color.fromARGB(255, 24, 128, 255),
            ),
            child: Text('Cancelar'),
            ),

          TextButton(
            onPressed: (){
              Navigator.of(context).pop();
              deleteAllTodos();
            }, 

            style: TextButton.styleFrom(foregroundColor: Colors.red,
            ),

            child: Text('Limpar tudo')
            ),
        ],
      ),
      );
  }

  void deleteAllTodos(){
    setState(() {
      todos.clear();
    });
    todoRepository.saveTodoList(todos);

  }

}