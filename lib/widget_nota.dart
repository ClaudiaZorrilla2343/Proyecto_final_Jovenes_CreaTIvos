import 'package:flutter/material.dart';
import 'package:proyecto_final/models/agregar.dart';

class NoticaCreada extends StatelessWidget {
  final Agregar agregar;
  final VoidCallback deleteOnPressed;
  final GestureTapCallback onTap;

  const NoticaCreada(
      {Key key,
      @required this.agregar,
      @required this.deleteOnPressed,
      @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(agregar.title),
        subtitle: Text(agregar.text),
        leading: Icon(Icons.event_note),
        trailing: IconButton(
          icon: Icon(Icons.delete_outline),
          onPressed: deleteOnPressed,
        ),
      ),
    );
  }
}
