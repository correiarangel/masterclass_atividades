import 'package:flutter/material.dart';

import '../../../shared/controllers/theme_controller.dart';
import '../../../shared/util/value/const_colors.dart';
import '../todo_store.dart';

class DailogAdd extends StatefulWidget {
  final String hintText;
  final String lblText;
  final TodoStore todoStore;
  final ThemeController themeController;
  final Function errorText;
  const DailogAdd({
    Key? key,
    required this.hintText,
    required this.lblText,
    required this.todoStore,
    required this.themeController,
    required this.errorText,
  }) : super(key: key);

  @override
  State<DailogAdd> createState() => _DailogAddState();
}

class _DailogAddState extends State<DailogAdd> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 0.8,
      child: AnimatedBuilder(
          animation: widget.todoStore,
          builder: (context, child) {
            return Container(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(height: 18.0),
                  const Text(
                    "Adicionar",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28.0),
                  ),
                  const SizedBox(height: 18.0),
                  TextField(
                    onChanged: widget.todoStore.changesTitle,

                    style: const TextStyle(fontSize: 18.0),

                    keyboardType: TextInputType.text,
                    // inputFormatters: [maskFormatter],
                    decoration: InputDecoration(
                      // ignore: unnecessary_null_comparison
                      errorText: widget.errorText == null
                          ? 'Not error'
                          : widget.errorText(),
                      errorStyle: const TextStyle(
                        fontSize: 18.0,
                      ),
                      // ignore: unnecessary_null_comparison

                      contentPadding: const EdgeInsets.fromLTRB(
                        8.0,
                        10.0,
                        8.0,
                        10.0,
                      ),

                      filled: true,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: ConstColors.colorPrimary,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      hintText: widget.hintText,
                      labelText: widget.lblText,
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        //label
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: ConstColors.colorPrimary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context).pop();
                          widget.todoStore.changesTitle('');
                        },
                        icon: const Icon(Icons.cancel),
                        label: const Text('Cancelar'),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          if (widget.todoStore.title.isNotEmpty) {
                            Navigator.of(context).pop();
                            widget.todoStore.addTodo(
                              valueChecked: false,
                              title: widget.todoStore.title,
                            );
                            widget.todoStore.changesTitle('');
                          }
                        },
                        icon: const Icon(Icons.save),
                        label: const Text('Salvar'),
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
