import 'package:flutter/material.dart';
import 'package:noticias/src/pages/pages.dart';

//import 'package:noticias/src/services/services.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavegacionModel(),
      child: const Scaffold(
        body: _paginas(),
        bottomNavigationBar: _navegacion(),
      ),
    );
  }
}

// ignore: camel_case_types
class _navegacion extends StatelessWidget {
  const _navegacion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegacionmodel = Provider.of<_NavegacionModel>(context);
    //final newsService = Provider.of<NewsService>(context);
    return BottomNavigationBar(
        currentIndex: navegacionmodel.paginaActual,
        onTap: ((i) => navegacionmodel.paginaActual = i),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              label: 'Para ti'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.public,
              ),
              label: 'Encabezados'),
        ]);
  }
}

// ignore: camel_case_types
class _paginas extends StatelessWidget {
  const _paginas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegacionmodel = Provider.of<_NavegacionModel>(context);
    return PageView(
      controller: navegacionmodel.pageController,
      //physics: const BouncingScrollPhysics(),
      physics: const NeverScrollableScrollPhysics(),
      // ignore: prefer_const_literals_to_create_immutables
      children: <Widget>[const Tab1Page(), const Tab2Page()],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  final PageController _pageController = PageController();

  int get paginaActual => _paginaActual;
  set paginaActual(int valor) {
    _paginaActual = valor;
    _pageController.animateToPage(valor,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => _pageController;
}
