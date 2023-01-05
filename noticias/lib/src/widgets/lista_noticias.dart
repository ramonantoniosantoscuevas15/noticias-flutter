// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:noticias/src/models/models.dart';
import 'package:noticias/src/theme/tema.dart';

class ListaNoticias extends StatelessWidget {
  const ListaNoticias({Key? key, required this.noticias}) : super(key: key);
  final List<Article> noticias;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: noticias.length,
        itemBuilder: (BuildContext context, int index) {
          return _Noticia(noticia: noticias[index], index: index);
        });
  }
}

class _Noticia extends StatelessWidget {
  const _Noticia({Key? key, required this.noticia, required this.index})
      : super(key: key);
  final Article noticia;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _TarjetaTopBar(
          noticia: noticia,
          //index: index,
        ),
        _Tarjetatitulo(noticia: noticia),
        _TarjetaImagen(noticia: noticia),
        const SizedBox(
          height: 10,
        ),
        const _TarjetaBotones(),
        const Divider()
      ],
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  const _TarjetaBotones({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RawMaterialButton(
          onPressed: (() {}),
          // ignore: deprecated_member_use
          fillColor: miTema.accentColor,

          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: const Icon(Icons.star_border_outlined),
        ),
        const SizedBox(
          width: 10,
        ),
        RawMaterialButton(
          onPressed: (() {}),
          fillColor: Colors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: const Icon(Icons.more),
        ),
      ],
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  const _TarjetaImagen({Key? key, required this.noticia}) : super(key: key);
  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
            child: (noticia.urlToImage != null)
                ? FadeInImage(
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Text(
                        '   Image not load   ',
                        style:
                            // ignore: deprecated_member_use
                            TextStyle(fontSize: 25, color: miTema.accentColor),
                      );
                    },
                    placeholder: const AssetImage('assets/img/giphy.gif'),
                    image: NetworkImage(noticia.urlToImage!),
                  )
                : const Image(
                    image: AssetImage('assets/img/no-image.png'),
                  )),
      ),
    );
  }
}

class _Tarjetatitulo extends StatelessWidget {
  const _Tarjetatitulo({Key? key, required this.noticia}) : super(key: key);
  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        noticia.title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  const _TarjetaTopBar({
    Key? key,
    required this.noticia,
    //required this.index,
  }) : super(key: key);
  final Article noticia;
  //final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          //Text(
          // '${index + 1}',
          // ignore: deprecated_member_use
          //style: TextStyle(color: miTema.accentColor),
          //),
          Text(noticia.source.name),
        ],
      ),
    );
  }
}
