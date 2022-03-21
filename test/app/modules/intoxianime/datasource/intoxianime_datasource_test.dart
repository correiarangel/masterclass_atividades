import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uno/uno.dart';

import 'package:masterclass_atividades/app/modules/intoxianime/datasource/intoxianime_datasource.dart';

class IntoxianimeDatasourceMock extends Mock implements IntoxianimeDatasource {}

Response getResponse({
  required data,
  required int statusCode,
}) {
  final Response response = Response(
      data: data,
      status: statusCode,
      request: Request(
        headers: {},
        timeout: Duration.zero,
        method: '',
        uri: Uri(),
      ),
      headers: {});
  return response;
}

void main() {
  late IntoxianimeDatasourceMock datasource;
  final response200 = getResponse(
    data: data,
    statusCode: 200,
  );
  final Response responseErroConect = getResponse(
    data: [],
    statusCode: 500,
  );

  setUpAll(() {
    datasource = IntoxianimeDatasourceMock();
    debugPrint("Iniciando Suite testes IntoxianimeDatasource");
  });
  setUp(() {
    debugPrint("Iniciando Suite tests");
  });

  tearDown(() {
    debugPrint("Finalizando Suite tests");
  });
  tearDownAll(() {
    debugPrint("Finalizando Suite testes IntoxianimeDatasource");
  });

  group('Caminho feliz ;] ', () {
    test('Deve retorna response StatusCode 200', () async {
      when(() => datasource.getIntoxiAnime(page: 1, perPage: 1))
          .thenAnswer((_) async => response200);

      expect(response200, isA<Response>());
      expect(response200.status, 200);
    });

    test('Deve retorna List com 1 posições em response.data', () async {
      when(() => datasource.getIntoxiAnime(page: 1, perPage: 1))
          .thenAnswer((_) async => response200);
      var list = response200.data as List;
      expect(list.length, 1);
    });
  });
  group('Caminho triste ;[ ', () {
    test('Deve retorna response.data List com 0 posições ', () async {
      when(() => datasource.getIntoxiAnime(page: 1, perPage: 1))
          .thenAnswer((invocation) async => responseErroConect);

      expect(responseErroConect, isA<Response>());
      var list = responseErroConect.data as List;
      expect(list.length, 0);
    });

    test('Deve retorna response statusCode, 500,...', () async {
      when(() => datasource.getIntoxiAnime(page: 1, perPage: 1))
          .thenAnswer((_) async => responseErroConect);
      expect(responseErroConect, isA<Response>());
      expect(responseErroConect.status, 500);
    });
  });
}


final data = [
  {
    "id": 97309,
    "date": "2022-03-13T16:36:01",
    "date_gmt": "2022-03-13T19:36:01",
    "guid": {"rendered": "https:www.intoxianime.comp=97309"},
    "modified": "2022-03-16T12:04:08",
    "modified_gmt": "2022-03-16T15:04:08",
    "slug": "guia-de-novos-animes-de-abril-2022",
    "status": "publish",
    "type": "post",
    "link": "https:www.intoxianime.com202203guia-de-novos-animes-de-abril-2022",
    "title": {"rendered": "Guia de Novos Animes de Abril 2022"},
    "content": {
      "rendered": "<p>Um guia com os novos animes da temporada de Abril </p>",
      "yoast_head_json": {
        "title": "Guia de Novos Animes de Abril 2022 - IntoxiAnime",
        "robots": {
          "index": "index",
          "follow": "follow",
          "max-snippet": "max-snippet:-1",
          "max-image-preview": "max-image-preview:large",
          "max-video-preview": "max-video-preview:-1"
        },
        "canonical":
            "https:www.intoxianime.com2022uia-de-novos-animes-de-abril-2022",
        "og_locale": "pt_BR",
        "og_type": "article",
        "og_title": "Guia de Novos Animes de Abril 2022 - IntoxiAnime",
        "og_description":
            "Um guia  com os novos animes da temporada de Abril (Primaverapring) 2022 comentados. Mais informações, novos animes e número de&#46;&#46;&#46;",
        "og_url": "https:www.intoxianime.comguia-de-novos-animes-de-abril-2022",
        "og_site_name": "IntoxiAnime",
        "article_publisher": "https:cebook.comintoxianime",
        "article_published_time": "2022-03-13T19:36:01+00:00",
        "article_modified_time": "2022-03-16T15:04:08+00:00",
        "og_image": [
          {
            "width": 1280,
            "height": 720,
            "url":
                "https:www.intoxianime.comwp-contentuploads202203Novos-animes-v4.jpg",
            "type": "imagejpeg"
          }
        ],
        "twitter_card": "summary",
        "twitter_creator": "@blogintoxianime",
        "twitter_site": "@blogintoxianime",
        "twitter_misc": {
          "Escrito por": "Marco",
          "Est. tempo de leitura": "42 minutos"
        },
        "schema": {
          "@context": "https:schema.org",
          "@graph": [
            {
              "@type": "WebSite",
              "@id": "https:www.intoxianime.com#website",
              "url": "https:www.intoxianime.com",
              "name": "IntoxiAnime",
              "description":
                  "Tudo sobre animes, tops, light novels, mangas, notícias, rankings e vendas.",
              "potentialAction": [
                {
                  "@type": "SearchAction",
                  "target": {
                    "@type": "EntryPoint",
                    "urlTemplate":
                        "https:/earch_term_string}"
                  },
                  "query-input": "required name=search_term_string"
                }
              ],
              "inLanguage": "pt-BR"
            },
            {
              "@type": "ImageObject",
              "@id":
                  "https:www.intoxianime.com202203uia-de-novos-animes-de-abril-2022#primaryimage",
              "inLanguage": "pt-BR",
              "url":
                  "https:ww.intoxianime.comwp-contentuploads202203Novos-animes-v4.jpg",
              "contentUrl":
                  "https:www.intoxianime.comwp-contentuploads202203Novos-animes-v4.jpg",
              "width": 1280,
              "height": 720
            },
            {
              "@type": "WebPage",
              "@id":
                  "https:www.intoxianime.com202203guia-de-novos-animes-de-abril-2022#webpage",
              "url":
                  "https:www.intoxianime.com202203guia-de-novos-animes-de-abril-2022",
              "name": "Guia de Novos Animes de Abril 2022 - IntoxiAnime",
              "isPartOf": {"@id": "https:/www.intoxianime.com#website"},
              "primaryImageOfPage": {
                "@id":
                    "https:www.intoxianime.com202203guia-de-novos-a#primaryimage"
              },
              "datePublished": "2022-03-13T19:36:01+00:00",
              "dateModified": "2022-03-16T15:04:08+00:00",
              "author": {
                "@id":
                    "https:www.intoxianime.com#schemapersona8c19bf1e27acaf424ebbe788cbb6ffb"
              },
              "breadcrumb": {
                "@id":
                    "https:www.intoxianime.com202203guia-de-novos-a#breadcrumb"
              },
              "inLanguage": "pt-BR",
              "potentialAction": [
                {
                  "@type": "ReadAction",
                  "target": [
                    "https:www.intoxianime.com202203guia-de-novos-anime"
                  ]
                }
              ]
            },
            {
              "@type": "BreadcrumbList",
              "@id":
                  "https:www.intoxianime.com202203guia-de-novos-an#breadcrumb",
              "itemListElement": [
                {
                  "@type": "ListItem",
                  "position": 1,
                  "name": "Início",
                  "item": "https:www.intoxianime.com"
                },
                {
                  "@type": "ListItem",
                  "position": 2,
                  "name": "Guia de Novos Animes de Abril 2022"
                }
              ]
            },
            {
              "@type": "Person",
              "@id": "https:8c19bf1e27acaf424ebbe788cbb6ffb",
              "name": "Marco",
              "image": {
                "@type": "ImageObject",
                "@id": "https:personlogo",
                "inLanguage": "pt-BR",
                "url": "https:26348b4a3471ebfb3fdbb45cac63124e?s=96&d=mm&r=g",
                "contentUrl":
                    "https:6348b4a3471ebfb3fdbb45cac63124e?s=96&d=mm&r=g",
                "caption": "Marco"
              },
              "url": "https:"
            }
          ]
        }
      },
      "_links": {
        "self": [
          {"href": "https:09"}
        ],
        "collection": [
          {"href": "https:posts"}
        ],
        "about": [
          {"href": "https:/post"}
        ],
        "author": [
          {"embeddable": true, "href": "https1"}
        ],
        "replies": [
          {"embeddable": true, "href": "https:omments?post=97309"}
        ],
        "version-history": [
          {"count": 24, "href": "https:revisions"}
        ],
        "predecessor-version": [
          {"id": 98247, "href": "https:revisions98247"}
        ],
        "wp:featuredmedia": [
          {"embeddable": true, "href": "https:98184"}
        ],
        "wp:attachment": [
          {"href": "httpsmedia?parent=97309"}
        ],
        "wp:term": [
          {
            "taxonomy": "category",
            "embeddable": true,
            "href": "https:ategories?post=97309"
          },
          {
            "taxonomy": "post_tag",
            "embeddable": true,
            "href": "https:ags?post=97309"
          }
        ],
        "curies": [
          {"name": "wp", "href": "https:{rel}", "templated": true}
        ]
      }
    }
  }
];
