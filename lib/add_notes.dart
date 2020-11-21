import 'package:flutter/material.dart';
import 'package:proyecto_final/models/agregar.dart';
import 'package:uuid/uuid.dart';

class AddNotes extends StatefulWidget {
  final Agregar agregar;

  const AddNotes({Key key, this.agregar}) : super(key: key);

  @override
  _AddNotesState createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();

  String _titleError;
  String _textError;

  @override
  void initState() {
    super.initState();
    if (widget.agregar != null) {
      _titleController.text = widget.agregar.title;
      _textController.text = widget.agregar.text;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _textController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.agregar == null ? "Nueva nota" : "Detalle"),
        backgroundColor: Colors.orange[600],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(children: [
          SizedBox(
            height: 8.0,
          ),
          TextField(
            controller: _titleController,
            decoration:
                InputDecoration(labelText: "Titulo", errorText: _titleError),
          ),
          SizedBox(
            height: 8.0,
          ),
          TextField(
            controller: _textController,
            decoration:
                InputDecoration(labelText: "Contenido", errorText: _textError),
          ),
          SizedBox(
            height: 450.0,
          ),
          SizedBox(
            width: screenSize.width * 0.9,
            height: 45.0,
            child: RaisedButton(
                color: Colors.orange,
                child: Text(
                  widget.agregar == null ? "Guardar" : "Actualizar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                onPressed: () {
                  create();
                }),
          )
        ]),
      ),
    );
  }

  void create() {
    var title = _titleController.text.trim();
    var text = _textController.text.trim();

    bool hasError = false;

    if (title.isEmpty) {
      setState(() {
        _titleError = "Ingresa un titulo";
      });
      hasError = true;
    }

    if (text.isEmpty) {
      setState(() {
        _textError = "Ingresa un texto";
      });
      hasError = true;
    }

    if (title.length < 3) {
      setState(() {
        _titleError = "El titulo debe tener mas de dos letras ";
      });
      hasError = true;
    }

    if (!hasError) {
      String id;
      if (widget.agregar == null) {
        id = Uuid().v4().replaceAll('-', '');
      } else {
        id = widget.agregar.id;
      }
      var agregar = Agregar(title: title, text: text, id: id);
      Navigator.of(context).pop(agregar);
    }
  }
}
