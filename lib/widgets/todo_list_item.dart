import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/models/todo.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    
    return Container(
    
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),

      margin: const EdgeInsets.symmetric(vertical: 2),
      padding: const EdgeInsets.all(16),
      
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          Text(
          DateFormat('dd/MMM/yyyy - HH:mm').format(todo.date), 
          style: TextStyle(
            fontSize: 12,
            ),
          ),
    
          Text(todo.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          ),
        ],
      ),
    );
  }
}