import 'package:flutter/material.dart';

class Artwork extends StatefulWidget {
  const Artwork({super.key});

  @override
  State<Artwork> createState() => _ArtworkState();
}

class _ArtworkState extends State<Artwork> {
  bool _isFavorite = false;
  bool _showDescription = false;

  void _toggleDescription() {
    setState(() {
      _showDescription = !_showDescription;
    });
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });

    if (_isFavorite) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Oeuvre ajoutée aux favoris",
          style: TextStyle(
            fontFamily: "Merriweather",
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        duration: Duration(
          seconds: 3,
        ),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Museum"),
        ),
        body: Center(
          child: Column(
            children: [
              Flexible(
                flex: 8,
                child: Stack(alignment: AlignmentDirectional.center, children: [
                  Image.asset(
                    "assets/images/Mona_Lisa.jpg",
                    fit: BoxFit.fitWidth,
                  ),
                  Opacity(
                      opacity: _isFavorite ? 1.0 : 0.5,
                      child: GestureDetector(
                          onDoubleTap: _toggleFavorite,
                          child: Icon(
                            Icons.favorite,
                            size: 100,
                            color: _isFavorite ? Colors.red : Colors.white,
                          ))),
                  Visibility(
                    visible: _showDescription ? true : false,
                    child: const SizedBox(
                        height: 300,
                        width: 320,
                        child: SingleChildScrollView(
                          child: Text(
                            """La Joconde, ou Portrait de Mona Lisa, est un tableau de l'artiste Léonard de Vinci, réaliséentre 1503 et 1506 ou entre 1513 et 15161,2, et peut-être jusqu'à 1517 (l'artiste étant mort le 2 mai 1519), qui représente un portrait mi-corps, probablement celui de la Florentine Lisa Gherardini, épouse de Francesco del Giocondo. Acquise par François Ier, cette peinture à l'huile sur panneau de bois de peuplier de 77 × 53 cm est exposée au musée du Louvre à Paris. La Joconde est l'un des rares tableaux attribués de façon certaine à Léonard de Vinci. La Joconde est devenue un tableau éminemment célèbre car, depuis sa réalisation, nombre d'artistes l'ont pris comme référence. À l'époque romantique, les artistes ont été fascinés par ce tableau et ont contribué à développer le mythe qui l'entoure, en faisant de ce tableau l’une des œuvres d'art les plus célèbres du monde, si ce n'est la plus célèbre : elle est en tout cas considérée comme l'une des représentations d'un visage féminin les plus célèbres au monde. Au xxie siècle, elle est devenue l'objet d'art le plus visité au monde, devant le diamant Hope, avec 20 000 visiteurs qui viennent l'admirer et la photographier quotidiennement.""",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Merriweather",
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ),
                ]),
              ),
              const Flexible(
                child: Column(children: [
                  Text(
                    "Mona Lisa",
                    style: TextStyle(
                      fontFamily: "Merriweather",
                      fontSize: 30,
                      color: Colors.brown,
                    ),
                  ),
                  Text(
                    "Léonard de Vinci",
                    style: TextStyle(
                      fontFamily: "Merriweather",
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.brown,
                    ),
                  ),
                ]),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: IconButton(
                        onPressed: () => _toggleDescription(),
                        icon: const Icon(
                          Icons.article,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: IconButton(
                          onPressed: () => _toggleFavorite(),
                          icon: Icon(
                            Icons.favorite,
                            color: _isFavorite ? Colors.red : Colors.brown,
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
