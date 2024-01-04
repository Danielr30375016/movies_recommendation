import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_recommendation/ui/nasa/astronomy_pictures/astronomy_pictures_bloc.dart';
import 'package:movies_recommendation/ui/nasa/astronomy_pictures/astronomy_pictures_state.dart';
import 'package:movies_recommendation/utils/constants.dart';

class AstronomyPicturesScreen extends StatefulWidget {
  const AstronomyPicturesScreen({super.key});

  @override
  State<AstronomyPicturesScreen> createState() =>
      _AstronomyPicturesScreenState();
}

class _AstronomyPicturesScreenState extends State<AstronomyPicturesScreen> {
  final AstronomyPicturesBloc _astronomyPicturesBloc =
      GetIt.I<AstronomyPicturesBloc>();
  final double _height = 200;
  final double _heightMobile = 300;
  final double _heightImg = 150;
  final int numMilliSeconds = 3000;

  @override
  void initState() {
    _astronomyPicturesBloc.getFirstState();
    _astronomyPicturesBloc.startPeriodicFunction(numMilliSeconds);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocBuilder<AstronomyPicturesBloc, AstronomyPicturesState>(
          bloc: _astronomyPicturesBloc,
          builder: (context, state) {
            return state.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : _body(state);
          }),
    ));
  }

  Widget _body(AstronomyPicturesState state) {
    return AnimatedContainer(
      duration: Duration(milliseconds: numMilliSeconds),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: state.colorGradient,
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: LayoutBuilder(
              builder: ((context, constraints) => SizedBox(
                    width: constraints.maxWidth,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Center(
                              child: Text(
                            "Astronomy pictures",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          )),
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: _wrapCards(constraints, state),
                          )
                        ]),
                  ))),
        ),
      ),
    );
  }

  Widget _wrapCards(BoxConstraints constraints, AstronomyPicturesState state) {
    return Wrap(
      runSpacing: 15,
      spacing: 15,
      children: List.generate(
          state.astronomyImages.length, (i) => _card(constraints, state, i)),
    );
  }

  Widget _card(
      BoxConstraints constraints, AstronomyPicturesState state, int i) {
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

  List<Widget> _childCard(
      BoxConstraints constraints, AstronomyPicturesState state, int i) {
    return [
      InkWell(
        onTap: () {},
        child: ClipRRect(
            borderRadius: MediaQuery.of(context).size.width > 600
                ? const BorderRadius.only(
                    topLeft: Radius.circular(5), bottomLeft: Radius.circular(5))
                : const BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            child: Image.network(
              state.astronomyImages[i].url ?? '',
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
                return Image.network(AppConstants.defaultImageNasaPictures,
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
                          onTap: () {},
                          child: Text(
                            state.astronomyImages[i].title ?? '',
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
                                  state.astronomyImages[i].explanation ?? '',
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
