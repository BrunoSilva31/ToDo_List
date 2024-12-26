import 'package:flutter/material.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({super.key, required this.title});

  final String title;

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
          Text('DATA', 
          style: TextStyle(
            fontSize: 12,
            ),
          ),
    
          Text(title,
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