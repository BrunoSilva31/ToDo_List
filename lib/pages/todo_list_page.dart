import 'package:flutter/material.dart';

class ToDoListPage extends StatelessWidget {
 const ToDoListPage({super.key});



  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body: Center(

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            
            child: Column(

              mainAxisSize: MainAxisSize.min,
              children: [
                
                Row(
                  
                  children: [
                    
                    Expanded( 
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Adicione uma tarefa',
                          hintText: 'Ex: Estudar Flutter'
                        ),
                      ),
                    ),
                
                    SizedBox(width: 8),
                
                    ElevatedButton(onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyanAccent,
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

                Row(
                  
                  children: [
                    Expanded(
                      child: Text(
                        'Você possui 0 tarefas pendentes',
                      ),
                    ),

                    ElevatedButton(onPressed: (){},
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyanAccent,
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
      );
  }

}