import 'package:flutter/material.dart';
import 'package:fluttertube_bloc/delegates/data_search.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 25,
          child: Image.asset('images/logo_youtube.png'),
        ),
        elevation: 0,
        backgroundColor: Colors.black87,
        actions: [
          const Align(
            alignment: Alignment.center,
            child: Text('0'),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.star),
          ),
          IconButton(
            onPressed: () async {
              //aqui eu pego o que digito no search do DataSearch que vem pela função close do buildResults
              String? result =
                  await showSearch(context: context, delegate: DataSearch());
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Container(),
    );
  }
}
