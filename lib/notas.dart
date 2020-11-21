//import 'dart:js';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:proyecto_final/add_notes.dart';
import 'package:proyecto_final/models/agregar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widget_nota.dart';

const String _agregarKey = 'agregar';

class Notas extends StatefulWidget {
  @override
  _NotasState createState() => _NotasState();
}

class _NotasState extends State<Notas> {
  List<Agregar> _agregar = [];

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((sharedPreferences) {
      var stringJson = sharedPreferences.getString(_agregarKey);
      if (stringJson != null) {
        List<dynamic> list = json.decode(stringJson);
        setState(() {
          _agregar = list.map((e) => Agregar.fromJson(e)).toList();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Mis notas"),
            backgroundColor: Colors.orange[600],
          ),
          body: ListView.builder(
            itemCount: _agregar.length,
            itemBuilder: (context, index) {
              return NoticaCreada(
                agregar: _agregar[index],
                deleteOnPressed: () {
                  _confirmDelete(index);
                },
                onTap: () {
                  _openCreateAgregarPage(agregar: _agregar[index]);
                },
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.orange[600],
            child: Icon(Icons.add),
            onPressed: () {
              _openCreateAgregarPage();
            },
          ),
        ));
  }

  void _openCreateAgregarPage({Agregar agregar}) {
    Navigator.of(context)
        .push(MaterialPageRoute(
      builder: (context) => AddNotes(agregar: agregar),
    ))
        .then((value) {
      if (value != null) {
        _addAgregarToList(value);
      }
    });
  }

  void _addAgregarToList(Agregar agregar) {
    setState(() {
      var index = _agregar.indexWhere((element) => element.id == agregar.id);
      if (index == -1) {
        _agregar.add(agregar);
      } else {
        _agregar[index] = agregar;
      }
      _saveInSharedPreferences(_agregar);
    });
  }

  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Cuidado"),
        content: Text(
            "¿Desea eliminar esta nota? Recuerde que el eliminado es de forma permanente"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text("Aceptar"),
          ),
        ],
      ),
    ).then((value) {
      if (value != null && value) {
        _deleteAgregar(index);
      }
    });
  }

  void _deleteAgregar(int index) {
    setState(() {
      _agregar.removeAt(index);
      _saveInSharedPreferences(_agregar);
    });
  }

  void _saveInSharedPreferences(List<Agregar> agregar) {
    var list = agregar.map((e) => e.toJson()).toList();
    var stringJson = json.encode(list);
    SharedPreferences.getInstance().then((sharedPreferences) {
      sharedPreferences.setString(_agregarKey, stringJson);
    });
  }
}
