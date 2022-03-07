import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:masterclass_atividades/app/modules/todo/todo_store.dart';
import 'package:masterclass_atividades/app/shared/controllers/theme_controller.dart';
import 'package:masterclass_atividades/app/shared/util/value/const_colors.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TodoStore todoStore = Modular.get();
  final ThemeController themeController = Modular.get();
  @override
  void initState() {
    todoStore.getAllTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: todoStore,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.keyboard_arrow_left,
                size: 42.0,
              ),
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),
            actions: [
              Observer(
                builder: (context) {
                  return IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.moon,
                      color: themeController.setColor(),
                    ),
                    onPressed: () async {
                      themeController.toChangesTheme();
                    },
                  );
                },
              )
            ],
            title: const Text(
              'Todos',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: todoStore.todos.isEmpty
                    ? const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : ListView.builder(
                        itemCount: todoStore.todos.length,
                        itemBuilder: (_, index) {
                          final todo = todoStore.todos[index];
                          return CheckboxListTile(
                            activeColor: ConstColors.colorPrimary,
                            title: Text(
                              todo.title,
                              style: const TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            value: todo.isChecked,
                            onChanged: (value) async{
                             await todoStore.editTodo(
                                valueChecked: todo.isChecked,
                                id: todo.id,
                              );
          
                              debugPrint('EDITOU : ${todoStore.mapEdit} ....');
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
