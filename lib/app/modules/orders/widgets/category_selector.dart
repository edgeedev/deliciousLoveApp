import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;
  final List<String> categories = ["Todos","Em aberto", "Confirmados", "Em Produção", "Finalizados", "Entregues"];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: Color.fromARGB(255, 246,134,189),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index){
            return GestureDetector(
              onTap: (){
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
                child: Text(
                  categories[index],
                  style: TextStyle(
                      color: index == selectedIndex ? Colors.white : Colors.white60,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5
                  ),
                ),
              ),
            );
          },
      ),
    );
  }
}

