import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;

  const Botao({
    Key? key,
    required this.texto,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(texto),
    );
  }
}
