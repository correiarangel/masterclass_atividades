import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterclass_atividades/app/modules/intoxianime/event/intoxianime_event.dart';

import '../../../shared/controllers/theme_controller.dart';
import '../blocs/intoxianime_bloc.dart';

import '../states/intoxianime_state.dart';
import 'card_anime.dart';

class ListViewIntoxianime extends StatelessWidget {
  final IntoxianimeBloc bloc;
  final ThemeController themeController;
  //final Function eventFetch;
  const ListViewIntoxianime({
    required this.themeController,
   // required this.eventFetch,
    required this.bloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // final top = 270.0;// MediaQuery.of(context).size.height;
    Widget listReturn = Container();
    final state = bloc.state;
    if (state is IntoxianimeStateInitial) {
      listReturn = Padding(
        padding: const EdgeInsets.only(top: 90),
        child: Text(
          'Nenhum artigo encontrado',
          style: TextStyle(fontSize: 18.0),
        ),
      );
    }
    if (state is IntoxianimeStateLoading) {
      listReturn = Padding(
        padding: EdgeInsets.only(top: 90),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (state is IntoxianimeStateException) {
      listReturn = Padding(
        padding: EdgeInsets.only(top: 90),
        child: Center(
          child: TextButton.icon(
            onPressed: () {
              //bloc.add();
              bloc.add(FetchIntoxianimeEvent());
            },
            icon: const Icon(
              Icons.refresh_outlined,
              size: 28.0,
            ),
            label: const Text(
              'Erro ao buscar Anime',
              style: TextStyle(fontSize: 22.0),
            ),
          ),
        ),
      );
    }

    if (state is IntoxianimeStateSuccess) {
      listReturn =  Padding(
          padding: const EdgeInsets.only(top: 38.0),
          child: ListView.builder(
            itemCount: state.animeModels.length,
            itemBuilder: (_, index) {
              final anime = state.animeModels[index];
              return CardAnime(
                number: '$index',
                title: anime.title,
                themeController: themeController,
                guidUrl: anime.guidUrl,
                link: anime.link,
              );
            },
          ),
        );
    }
    return SizedBox(child: listReturn,height: 400.0,);
  }
}

/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/controllers/theme_controller.dart';
import '../blocs/intoxianime_bloc.dart';

import '../states/intoxianime_state.dart';
import 'card_anime.dart';

class ListViewIntoxianime extends StatelessWidget {
  final ThemeController themeController;
  final Function eventFetch;
  const ListViewIntoxianime({
    required this.themeController,
    required this.eventFetch,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).size.height;
    Widget listReturn = Container();

    return BlocBuilder<IntoxianimeBloc, IntoxianimeState>(
      builder: (context, state) {
        if (state is IntoxianimeStateInitial) {
          listReturn = Padding(
            padding: EdgeInsets.only(top: top / 3),
            child: const Center(
              child: Text(
                'Nenhum artigo encontrado',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          );
        }
        if (state is IntoxianimeStateLoading) {
          listReturn = Padding(
            padding: EdgeInsets.only(top: top / 3),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is IntoxianimeStateException) {
          listReturn = Padding(
            padding: EdgeInsets.only(top: top / 3),
            child: Center(
              child: TextButton.icon(
                onPressed: () {
                  //bloc.add();
                  eventFetch();
                },
                icon: const Icon(
                  Icons.refresh_outlined,
                  size: 28.0,
                ),
                label: const Text(
                  'Erro ao buscar Anime',
                  style: TextStyle(fontSize: 22.0),
                ),
              ),
            ),
          );
        }

        if (state is IntoxianimeStateSuccess) {
          listReturn = Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: ListView.builder(
                itemCount: state.animeModels.length,
                itemBuilder: (_, index) {
                  final anime = state.animeModels[index];
                  return CardAnime(
                    number: '$index',
                    title: anime.title,
                    themeController: themeController,
                    guidUrl: anime.guidUrl,
                    link: anime.link,
                  );
                },
              ),
            ),
          );
        }
        return listReturn;
      },
    );
  }
}

 */