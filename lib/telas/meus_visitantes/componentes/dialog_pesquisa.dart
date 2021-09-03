import 'package:flutter/material.dart';

class DialogPesquisa extends StatelessWidget {
  DialogPesquisa(this.pesquisaAtual)
      : controller = TextEditingController(text: pesquisaAtual);

  final String pesquisaAtual;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 2,
          left: 2,
          right: 2,
          child: Card(
            child: TextField(
              style: TextStyle(fontSize: 23),
              autofocus: true,
              textInputAction: TextInputAction.search,
              onSubmitted: (text) {
                Navigator.of(context).pop(text);
              },
              controller: controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                border: InputBorder.none,
                prefix: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.grey[700],
                    size: 20,
                  ),
                  onPressed: Navigator.of(context).pop,
                ),
                suffix: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.grey[700],
                    size: 20,
                  ),
                  onPressed: controller.clear,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
