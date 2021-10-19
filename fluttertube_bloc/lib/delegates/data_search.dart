import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//SearchDelegate do tipo string que é o que vamos pesquisar
class DataSearch extends SearchDelegate<String> {
  //botão da direita que aparece durante a pesquisa
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          //query seria a string que digitamos para busca
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  //botão da esquerda que aparece durante a pesquisa
  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

  suggestions(String search) async {
    http.Response response = await http.get(Uri.parse(
        'http://suggestqueries.google.com/complete/search?hl=en&ds=yt&client=youtube&hjson=t&cp=1&q=$search&format=5&alt=json'));
  }
}
