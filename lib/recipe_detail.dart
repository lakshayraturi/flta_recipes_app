import "package:flutter/material.dart";
import "./recipe.dart";

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  RecipeDetail({required this.recipe});

  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        child: Column(children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image(image: AssetImage(widget.recipe.imageUrl)),
          ),
          SizedBox(height: 4),
          Text(
            widget.recipe.label,
            style: TextStyle(fontSize: 18),
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: widget.recipe.ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  final ingredient = widget.recipe.ingredients[index];
                  return Text(
                      '${ingredient.measure} ${ingredient.quantity} ${ingredient.name}');
                }),
          ),
        ]),
      ),
    );
  }
}