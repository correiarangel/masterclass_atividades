import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/interface/check_internet_interface.dart';
import '../../shared/interface/general_version_interface.dart';
import '../../shared/services/todo_service.dart';
import '../../shared/util/check_internet.dart';
import '../../shared/util/general_version.dart';
import '../animations/animations_module.dart';
import '../home/home_store.dart';
import '../mockup/mockup_module.dart';
import '../playground/playground_module.dart';
import 'github_repos/blocs/github_bloc.dart';
import 'github_repos/datasources/guithub_datasources.dart';
import 'github_repos/datasources/interface/guithub_datasource_interface.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
        Bind(
      (i) => Dio(
        BaseOptions(
          receiveTimeout: 5000,
          connectTimeout: 5000,
        ),
      ),
    ),
    Bind<IGuitHubDatasources>((i) => GuitHubDatasources(i.get())),
    Bind((i)=> GitHubBloc(i.get())),
    Bind((i) => TodoService(i.get())),
    Bind<IGeneralVersion>((i) => GeneralVersion()),
    Bind<ICheckInternet>((i) => CheckInternet()),
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/home', child: (_, args) => const HomePage()),
    ModuleRoute(Modular.initialRoute, module: PlaygroundModule()),
    ModuleRoute(Modular.initialRoute, module: AnimationsModule()),
    ModuleRoute(Modular.initialRoute, module: MockupModule()),
    
  ];
}
