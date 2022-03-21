import 'package:flutter/material.dart';
import '../model/intoxianime_model.dart';
import '../event/intoxianime_event.dart';

import '../../../shared/controllers/theme_controller.dart';
import '../blocs/intoxianime_bloc.dart';

import '../states/intoxianime_state.dart';
import 'card_anime_custom.dart';

class ListViewIntoxianime extends StatefulWidget {
  final IntoxianimeBloc bloc;
  final ThemeController themeController;
  //final double height;
  final Function eventFetch;
  const ListViewIntoxianime({
    required this.themeController,
    required this.eventFetch,
    required this.bloc,
    Key? key,
  }) : super(key: key);

  @override
  State<ListViewIntoxianime> createState() => _ListViewIntoxianimeState();
}

class _ListViewIntoxianimeState extends State<ListViewIntoxianime> {
  final ScrollController _scrollController = ScrollController();
  // ignore: prefer_final_fields
  late List<IntoxianimeModel> _infinityAnimeModels = [];
  addList(List<IntoxianimeModel> animeModels) {}
  bool isAddInList = false;
  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        setState(() => isAddInList = true);
        debugPrint('Fim da lista');
        widget.eventFetch();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget listReturn = Container();
    final state = widget.bloc.state;
    if (state is IntoxianimeStateInitial) {
      listReturn = const Padding(
        padding: EdgeInsets.only(top: 90),
        child: Center(
          child: Text(
            'Nenhum artigo encontrado',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
    }
    if (state is IntoxianimeStateLoading) {
      listReturn = const Padding(
        padding: EdgeInsets.only(top: 90),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (state is IntoxianimeStateException) {
      listReturn = Padding(
        padding: const EdgeInsets.only(top: 90),
        child: Center(
          child: TextButton.icon(
            onPressed: () {
              //bloc.add();

              widget.bloc.add(FetchIntoxianimeEvent());
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

/*     if (state is IntoxianimeStateSuccess) {
      listReturn = Padding(
        padding: const EdgeInsets.only(top: 38.0),
        child: ListView.builder(
          itemCount: state.animeModels.length,
          itemBuilder: (_, index) {
            final anime = state.animeModels[index];
            return CardAnimeCustom(
              themaController: themeController,
              imgHeaderPath: 'images/glasses.png',
              textHeader: 'Anime',
              textButton: 'Ver Mais',
              textLink: 'Acessar',
              description: anime.title,
              urlLink: anime.link,
              guidUrl: anime.guidUrl,
            );
          },
        ),
      );
    }
 */
    if (state is IntoxianimeStateSuccess) {
      for (var element in state.animeModels) {
        _infinityAnimeModels.add(element);
      }
      debugPrint("ITENS LISTA  ${_infinityAnimeModels.length}");
      listReturn = Padding(
        padding: const EdgeInsets.only(top: 38.0),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final anime = _infinityAnimeModels[index];
                  isAddInList = false;
                  return CardAnimeCustom(
                    themaController: widget.themeController,
                    imgHeaderPath: 'images/glasses.png',
                    textHeader: 'Anime',
                    textButton: 'Ver Mais',
                    textLink: 'Acessar',
                    description: anime.title,
                    urlLink: anime.link,
                    guidUrl: anime.guidUrl,
                    index: index.toString(),
                  );
                },
                childCount: _infinityAnimeModels.length,
              ),
            )
          ],
        ),
      );
    }
    return SizedBox(
      child: listReturn,
    );
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
