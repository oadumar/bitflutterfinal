import 'package:cursoflutter/data/apiService.dart';
import 'package:cursoflutter/presenter/build_itemlist.dart';
import 'package:flutter/material.dart';
//  import '../utils/styles.dart';
import '../view/widgets/dialog_button.dart';

class BuildView extends StatelessWidget {
  final String viewName;
  final int intNews;

  BuildView({@required this.viewName, @required this.intNews});

  @override
  Widget build(BuildContext context) {
    switch (viewName) {
      case 'NewsList':
        return Container(
          child: Center(
            child: Container(
              child: FutureBuilder(
                future: ApiService().getDio(optionUrl: intNews),
                builder: (context, retornado) {
                  if (retornado.hasData) {
                    return ListView.builder(
                      itemCount: (retornado.data).articlesList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return BuildItemList(
                          retornadoData: (retornado.data).articlesList[index],
                          onTapFav: (news) {
                            print(news.title);
                            showDialog(
                              context: context,
                              barrierDismissible:
                                  false, //  no cierra el modal hasta que se le instruya que lo haga.
                              builder: (_) => AlertDialog(
                                //  title: Text('Confirmación'),  // Para mostrar el título del alerta
                                content: Text(
                                    'Are you sure to add this news to favorite list?'),
                                actions: [
                                  DialogButton(
                                    texto: 'No',
                                    onPressed: () => Navigator.pop(context),
                                    ancho: 90.0,
                                  ),
                                  DialogButton(
                                    texto: 'Si',
                                    onPressed: () {},
                                    ancho: 90.0,
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    );
                  } else if (retornado.hasError) {
                    return Container();
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        );
      case 'FavoriteList':
        return Container();

      default:
        return Container();
    }
  }
}
