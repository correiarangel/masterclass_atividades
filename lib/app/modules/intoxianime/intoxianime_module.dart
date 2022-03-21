import 'package:flutter_modular/flutter_modular.dart';
import 'package:uno/uno.dart';

import 'blocs/intoxianime_bloc.dart';
import 'datasource/interface/intoxianime_datasource_interface.dart';
import 'datasource/intoxianime_datasource.dart';
import 'intoxianime_page.dart';
import 'intoxianime_store.dart';
import 'repository/interface/intoxianime_repository_interface.dart';
import 'repository/intoxianime_repository.dart';

class IntoxianimeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind(
      (i) => Uno(
        timeout: const Duration(seconds: 20),
      ),
    ),
    Bind<IIntoxianimeDatasource>(
      (i) => IntoxianimeDatasource(
        i.get(),
      ),
    ),
    Bind.lazySingleton((i) => IntoxianimeStore()),
    Bind<IIntoxianimeDatasource>((i)=>IntoxianimeDatasource(i.get())),
    Bind<IIntoxianimeRepository>((i)=> IntoxianimeRepository(i.get())),
    //Bind((i)=> BlocProvider(create: (context)=> IntoxianimeBloc(i.get()))), 
    Bind((i)=> IntoxianimeBloc(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/intoxiPage',
      child: (_, args) => const IntoxianimePage(),
    ),
  ];
}
