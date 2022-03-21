import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'components/listview_intoxianime.dart';

import '../../shared/controllers/theme_controller.dart';
import 'blocs/intoxianime_bloc.dart';
import 'event/intoxianime_event.dart';
import 'intoxianime_store.dart';

class IntoxianimePage extends StatefulWidget {
  const IntoxianimePage({Key? key}) : super(key: key);
  @override
  IntoxianimePageState createState() => IntoxianimePageState();
}

class IntoxianimePageState extends State<IntoxianimePage> {
  final IntoxianimeStore store = Modular.get();
  final ThemeController themeController = Modular.get();
  final IntoxianimeBloc bloc = Modular.get();
  late StreamSubscription sub;

  @override
  void initState() {
    super.initState();

    sub = bloc.stream.listen((event) {
      setState(() {});
    });
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      bloc.add(FetchIntoxianimeEvent());
    });
  }

  void eventFetch() => bloc.add(FetchIntoxianimeEvent());

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
/*     Widget listReturn = Container();
    final state = bloc.state;
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

            /*  CardAnime(
                number: '$index',
                title: anime.title,
                themeController: themeController,
                guidUrl: anime.guidUrl,
                link: anime.link,
              ); */
          //},
        //),
      //);
    //} */

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
          'Intoxianime',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
      body: SizedBox(
        child: ListViewIntoxianime(
          eventFetch: eventFetch,
          themeController: themeController,
          bloc: bloc,
        ),
        height: _height,
      ),
    );
  }
}
