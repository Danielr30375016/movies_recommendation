import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_recommendation/ui/animes/animes_bloc.dart';
import 'package:movies_recommendation/ui/animes/animes_state.dart';
import 'package:movies_recommendation/utils/constants.dart';

class AnimesScreen extends StatefulWidget {
  const AnimesScreen({super.key});

  @override
  State<AnimesScreen> createState() => _AnimesScreenState();
}

class _AnimesScreenState extends State<AnimesScreen> {
  final double _height = 200;
  final double _heightMobile = 300;
  final double _heightImg = 150;
  final AnimesBloc _moviesBloc = GetIt.I<AnimesBloc>();
  final int numMilliSeconds = 3000;

  @override
  void initState() {
    _moviesBloc.getFirstState();
    _moviesBloc.startPeriodicFunction(numMilliSeconds);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<AnimesBloc, AnimeState>(
          bloc: _moviesBloc,
          builder: ((context, state) {
            return state.isLoading || state.comics == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : _body(state);
          })),
    ));
  }

  Widget _body(AnimeState state) {
    return AnimatedContainer(
      duration: Duration(milliseconds: numMilliSeconds),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: state.colorGradient,
          // state.aux ? state.colorGradient : state.colorGradient2,
          // Puedes ajustar la lista de colores según tus preferencias
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: Text(
                "MARVEL COMICS",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: LayoutBuilder(builder: (context, constraints) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 1,
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  child: SizedBox(
                    child: Wrap(
                      spacing: 15,
                      runSpacing: 15,
                      children: List.generate(
                          state.comics!.data!.results!.length,
                          (i) => _card(constraints, state, i)),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _card(BoxConstraints constraints, AnimeState state, int i) {
    return Container(
      width: constraints.maxWidth,
      height: MediaQuery.of(context).size.width > 600 ? _height : _heightMobile,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.5),
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 2)]),
      child: MediaQuery.of(context).size.width > 600
          ? Row(
              children: _childCard(constraints, state, i),
            )
          : Column(
              children: _childCard(constraints, state, i),
            ),
    );
  }

  List<Widget> _childCard(BoxConstraints constraints, AnimeState state, int i) {
    return [
      InkWell(
        onTap: () {
          if (state.comics?.data?.results?[i].urls?.isNotEmpty ?? false) {
            _moviesBloc
                .launchURL(state.comics?.data?.results?[i].urls?[0].url ?? '');
          }
        },
        child: ClipRRect(
            borderRadius: MediaQuery.of(context).size.width > 600
                ? const BorderRadius.only(
                    topLeft: Radius.circular(5), bottomLeft: Radius.circular(5))
                : const BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            child: Image.network(
              state.comics?.data?.results?[i].images?.isEmpty ?? true
                  ? ''
                  : "${state.comics?.data?.results?[i].images?[0].path}.${state.comics?.data?.results?[i].images?[0].extension}",
              width: MediaQuery.of(context).size.width > 600
                  ? 300
                  : constraints.maxWidth,
              height: MediaQuery.of(context).size.width > 600
                  ? _height
                  : _heightImg,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  // La imagen se ha cargado correctamente
                  return child;
                } else {
                  // Mientras se está cargando la imagen, se muestra un CircularProgressIndicator
                  return CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  );
                }
              },
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                // En caso de error al cargar la imagen, se muestra una imagen por defecto
                return Image.network(AppConstants.defaultImage,
                    width: MediaQuery.of(context).size.width > 600
                        ? 300
                        : constraints.maxWidth,
                    height: MediaQuery.of(context).size.width > 600
                        ? _height
                        : _heightImg,
                    fit: BoxFit
                        .cover); // Ajusta la ruta según tu estructura de archivos
              },
            )),
      ),
      Expanded(
          child: LayoutBuilder(
              builder: (context, constraintsCard) => Container(
                    padding: const EdgeInsets.all(15),
                    width: constraintsCard.maxWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            if (state.comics?.data?.results?[i].urls
                                    ?.isNotEmpty ??
                                false) {
                              _moviesBloc.launchURL(state
                                      .comics?.data?.results?[i].urls?[0].url ??
                                  '');
                            }
                          },
                          child: Text(
                            state.comics?.data?.results?[i].title ?? '',
                            style: TextStyle(
                                color: Colors.indigo[900],
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: LayoutBuilder(
                              builder: (context, constratinsDes) => SizedBox(
                                width: constratinsDes.maxWidth,
                                height: constratinsDes.maxHeight,
                                child: Text(
                                  state.comics?.data?.results?[i].textObjects
                                              ?.isEmpty ??
                                          true
                                      ? ''
                                      : state.comics?.data?.results?[i]
                                              .textObjects![0].text ??
                                          ''
                                              '',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )))
    ];
  }
}
