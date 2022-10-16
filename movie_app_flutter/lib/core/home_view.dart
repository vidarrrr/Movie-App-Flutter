import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app_flutter/common/padding.dart';
import 'package:movie_app_flutter/model/chip_types_model.dart';
import 'package:movie_app_flutter/model/tab_types_model.dart';
import 'package:movie_app_flutter/project/drawer_view.dart';
import 'package:movie_app_flutter/project/list_genre_view.dart';
import 'package:movie_app_flutter/project/list_movie_view.dart';
import 'package:movie_app_flutter/project/list_tab_view.dart';
import 'package:movie_app_flutter/project/menu_search_view.dart';

import '../data/source/local/shared_prefs.dart';
import '../data/source/remote/service/dio_service.dart';
import '../model/movie_model.dart';
import 'detail_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //} with WidgetsBindingObserver {
  final _controller = TextEditingController();
  List<MovieModel>? _movieModels;
  List<MovieModel>? _movieModelsBackUp;
  late final DioService _dioService;
  final List<String> _watchList = [];
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  final String errorString = "error";

  @override
  void initState() {
    super.initState();
    _dioService = DioService();
    getMovies(TabTypes.inTheatre.type);
    updateWatchList();
    //WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    //WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   print("state");
  //   print(state);
  //   if (state == AppLifecycleState.resumed) {
  //     updateWatchList();
  //   }
  // }

  Future<void> getMovies(int type) async {
    final List<MovieModel>? response;
    if (type == TabTypes.inTheatre.type) {
      response = await _dioService.getMovies((error) {
        toastError(error);
      });
    } else if (type == TabTypes.boxOffice.type) {
      response = await _dioService.getBoxOfficeMovies((error) {
        toastError(error);
      });
    } else if (type == TabTypes.comingSoon.type) {
      response = await _dioService.getComingSoonMovies((error) {
        toastError(error);
      });
    } else {
      response = await _dioService.getMovies((error) {
        toastError(error);
      });
    }

    if (response != null) {
      setState(() {
        _movieModels = response;
        _movieModelsBackUp = _movieModels;
      });
    }
  }

  void resetLastBackUpMovieModels() {
    setState(() {
      if (_movieModelsBackUp != null) {
        //https://stackoverflow.com/questions/58389591/how-to-copy-list-values-to-another-list-in-flutter
        _movieModels = List.from(_movieModelsBackUp!);
      }
    });
  }

  List<MovieModel>? filterMovieListByGenre(ChipTypes chipType, String? text) {
    //https://stackoverflow.com/questions/49578529/flutter-filter-list-as-per-some-condition
    if (chipType.type == -1 && (text == null || text.isEmpty)) {
      if (_movieModelsBackUp != null) {
        return List.from(_movieModelsBackUp!);
      } else {
        return null;
      }
    } else if (chipType.type == -1 && text != null && text.isNotEmpty) {
      return _movieModelsBackUp
          ?.where((element) =>
              element.title!.toLowerCase().contains(text.toLowerCase()))
          .toList();
    }

    if (text == null || text.isEmpty) {
      return _movieModelsBackUp
          ?.where((element) =>
              element.genres!.toLowerCase().contains(chipType.getName()))
          .toList();
    } else {
      return _movieModelsBackUp
          ?.where((element) =>
              element.genres!.toLowerCase().contains(chipType.getName()) &&
              element.title!.toLowerCase().contains(text.toLowerCase()))
          .toList();
    }
  }

  List<MovieModel>? filterMovieListBySearch(String? text, ChipTypes chipType) {
    //https://stackoverflow.com/questions/49578529/flutter-filter-list-as-per-some-condition
    if (text == null || text.isEmpty) {
      return List.from(_movieModelsBackUp!);
    }
    if (chipType.type == ChipTypes.defaultType.type) {
      return _movieModelsBackUp
          ?.where((element) =>
              element.title!.toLowerCase().contains(text.toLowerCase()))
          .toList();
    } else {
      return _movieModels
          ?.where((element) =>
              element.title!.toLowerCase().contains(text.toLowerCase()))
          .toList();
    }
  }

  void toastError(String? error) {
    Fluttertoast.showToast(
      msg: error ?? errorString,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.white,
      textColor: Colors.black,
    );
  }

  int _currentIndex = -1;

  int _currentTabIndex = 0;

  void changeCurrentIndex(int index) {
    setState(() {
      if (_currentIndex == index) {
        _currentIndex = -1;
      } else {
        _currentIndex = index;
      }
    });
  }

  void changeCurrentTabIndex(int index) {
    setState(() {
      _currentTabIndex = index;
    });
  }

  void setMovieModel(List<MovieModel>? list) {
    setState(() {
      if (list != null && list.isEmpty) {
        _movieModels = null;
      } else {
        _movieModels = list;
      }
    });
  }

  ChipTypes getChipType(int type) {
    if (type == ChipTypes.action.type) {
      return ChipTypes.action;
    } else if (type == ChipTypes.comedy.type) {
      return ChipTypes.comedy;
    } else if (type == ChipTypes.crime.type) {
      return ChipTypes.crime;
    } else if (type == ChipTypes.drama.type) {
      return ChipTypes.drama;
    } else if (type == ChipTypes.action1.type) {
      return ChipTypes.action1;
    } else if (type == ChipTypes.action2.type) {
      return ChipTypes.action2;
    } else {
      return ChipTypes.defaultType;
    }
  }

  void callClearInit(TextEditingController controller, int chipType) {
    controller.clear();
    if (chipType == ChipTypes.defaultType.type) {
      resetLastBackUpMovieModels();
    } else {
      resetLastBackUpMovieModels();
      setMovieModel(filterMovieListByGenre(getChipType(chipType), null));
    }
  }

  void updateWatchList() {
    _watchList.clear();

    setState(() {
      int index = SharedPrefHelper.getMenuIndex();

      for (int i = 0; i < index; i++) {
        _watchList.add(
            SharedPrefHelper.getString("${SharedPrefHelper.menuItemSuffix}$i"));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //needs listview
    return RefreshIndicator(
      onRefresh: () async {
        getMovies(_currentTabIndex);
      },
      child: buildScaffold(context),
    );
  }

  Scaffold buildScaffold(BuildContext context) {
    const movieNotFound = "Movie is not found in current list";
    return Scaffold(
      key: _key,
      drawerEnableOpenDragGesture: false,
      drawer: DrawerView(
        watchList: _watchList,
        onClickTitle: (text) {
          var list = _movieModelsBackUp
              ?.where((element) =>
                  element.title?.toLowerCase() == text.toLowerCase())
              .toList();

          if (list != null && list.isNotEmpty) {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return DetailView(movieModel: list[0]);
              },
            ));
          } else {
            toastError(movieNotFound);
          }
        },
      ),
      //https://stackoverflow.com/questions/46551268/when-the-keyboard-appears-the-flutter-widgets-resize-how-to-prevent-this
      resizeToAvoidBottomInset: false,
      body: ListView(children: [
        Padding(
          padding: PaddingHelper()
              .getPaddingOnlyLeft(8)
              .copyWith(top: 8.0, right: 8.0),
          child: Column(children: [
            MenuSearchView(
                textEditingController: _controller,
                onTap: () {
                  updateWatchList();
                  _key.currentState?.openDrawer();
                },
                onChanged: (value) {
                  setMovieModel(filterMovieListBySearch(
                      value, getChipType(_currentIndex)));
                },
                callClear: () {
                  callClearInit(_controller, _currentIndex);
                }),
            ListTabView(
                currentIndex: _currentTabIndex,
                changeCurrentTabIndex: (index) {
                  changeCurrentTabIndex(index);
                  getMovies(index);
                }),
            ListGenreView(
                setMovieModel: () {
                  setMovieModel(filterMovieListByGenre(
                      getChipType(_currentIndex), _controller.text));
                },
                changeCurrentIndex: changeCurrentIndex,
                currentIndex: _currentIndex),
            if (_movieModels != null)
              ListMovieView(movieModelList: _movieModels!),
          ]),
        ),
      ]),
    );
  }
}
