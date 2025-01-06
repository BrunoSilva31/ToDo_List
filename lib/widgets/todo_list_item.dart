import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/models/todo.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({super.key, required this.todo, required this.onDelete,});

  final Todo todo;
  final Function(Todo) onDelete;

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Slidable(
      
        key: const ValueKey(0),
      
      
          endActionPane: ActionPane(
            motion: BehindMotion(),
            
            extentRatio: 0.3,
            
            children: [
            SlidableAction(
              onPressed: (context) {
                onDelete(todo);
              },
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(8),
              icon: Icons.delete,
              label: 'Delete',
              ),
            ],
          ),
      
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
      
          padding: const EdgeInsets.all(16),
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            
            children: [
              Text(
              DateFormat('dd/MMM/yyyy - HH:mm').format(todo.dateTime), 
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
          ),
      ),
    );

  }
}