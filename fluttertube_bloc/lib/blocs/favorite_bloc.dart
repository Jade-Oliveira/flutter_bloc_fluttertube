import 'dart:async';
import 'dart:ui';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:fluttertube_bloc/models/video.dart';

class FavoriteBloc implements BlocBase {
  final Map<String, Video> _favorites = {};

//aqui precisamos usar o broadcast para ter vários objetos observando o memsmo stream
  final StreamController<Map<String, Video>> _favController =
      StreamController<Map<String, Video>>.broadcast();
  Stream<Map<String, Video>> get outFav => _favController.stream;

  void toggleFavorite(Video video) {
    //se já tiver na lista eu removo ele
    if (_favorites.containsKey(video.id)) {
      _favorites.remove(video.id);
    } else {
      //aqui se não tiver na lista vai adicionar
      _favorites[video.id] = video;
    }
    _favController.sink.add(_favorites);
  }

  @override
  void addListener(VoidCallback listener) {}

  @override
  void dispose() {
    _favController.close();
  }

  @override
  bool get hasListeners => throw UnimplementedError();

  @override
  void notifyListeners() {}

  @override
  void removeListener(VoidCallback listener) {}
}
