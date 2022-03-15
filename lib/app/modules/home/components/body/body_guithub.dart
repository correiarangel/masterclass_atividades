import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../github_repos/blocs/github_bloc.dart';
import '../../github_repos/events/guithub_event.dart';
import '../../github_repos/states/guithub_state.dart';
import '../card/card_repository.dart';

class BodyGuitHub extends StatefulWidget {
  final ThemeController themeController;
  const BodyGuitHub({
    Key? key,
    required this.themeController,
  }) : super(key: key);

  @override
  State<BodyGuitHub> createState() => _BodyGuitHubState();
}

class _BodyGuitHubState extends State<BodyGuitHub> {
  late StreamSubscription sub;
  final GitHubBloc bloc = Modular.get();

  @override
  void initState() {
    super.initState();
    sub = bloc.stream.listen((event) {
      setState(() {});
    });
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      bloc.add(FetchGuitHubEvent());
    });
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).size.height;
    final state = bloc.state;
    Widget bodyGuitHub = Container();

    if (state is InitialGuitHubState) {
      bodyGuitHub = Padding(
        padding: EdgeInsets.only(top: top/3),
        child: const Center(
          child: Text(
            'Nenhum Repositorio encontrado',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
    }

    if (state is LoadingGuitHubState) {
      bodyGuitHub = Padding(
        padding: EdgeInsets.only(top: top/3),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (state is ExceptionGuitHubState) {
      bodyGuitHub = Padding(
        padding: EdgeInsets.only(top: top/3),
        child: Center(
          child: TextButton.icon(
            onPressed: () {

              bloc.add(FetchGuitHubEvent());
            },
            icon: const Icon(
              Icons.refresh_outlined,
              size: 28.0,
            ),
            label: const Text(
              'Erro ao buscar Repositorios',
              style: TextStyle(fontSize: 22.0),
            ),
          ),
        ),
      );
    }

    if (state is SuccessGuitHubState) {
      bodyGuitHub = Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 38.0),
          child: ListView.builder(
            itemCount: state.repoModels.length,
            itemBuilder: (_, index) {
              final repo = state.repoModels[index];
              return CardRepository(
                number: '$index',
                text: repo.name,
                themeController: widget.themeController,
                url: repo.htmlUrl,
              );
            },
          ),
        ),
      );
    }

    return SizedBox(
      height: top,
      child: Column(
        children: <Widget>[
          bodyGuitHub,
        ],
      ),
    );
  }
}
