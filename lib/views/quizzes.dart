import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:word_weather/utils/globals.dart';

class ChartData {
  ChartData(this.x, this.y1, this.y2, this.y3, this.y4, this.y5);
  final String x;
  final num y1;
  final num y2;
  final num y3;
  final num y4;
  final num y5;
}

class Quizzes extends StatefulWidget {
  const Quizzes({super.key});

  @override
  State<Quizzes> createState() => _QuizzesState();
}

class _QuizzesState extends State<Quizzes> {
  final PageController _pagesController = PageController();
  int _currentIndex = 0;
  @override
  void dispose() {
    _pagesController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    userLocalSettings!.put("first_time", false);
    super.initState();
  }

  final List<Map<String, dynamic>> _questions = <Map<String, dynamic>>[
    <String, dynamic>{
      "question": "Quel est votre principal moyen de transport quotidien ?",
      "options": <String>["Voiture individuelle à essence/diesel", "Transports en commun", "Vélo ou marche", "Véhicule électrique"]
    },
    <String, dynamic>{
      "question": "Quelle est votre alimentation principale ?",
      "options": <String>["Viande régulière", "Régime végétarien"]
    },
    <String, dynamic>{
      "question": "Pratiquez-vous le recyclage ?",
      "options": <String>["Oui, régulièrement", "Parfois", "Non"]
    },
    <String, dynamic>{
      "question": "Achetez-vous des produits d'occasion ou reconditionnés ?",
      "options": <String>["Souvent", "Parfois", "Rarement"]
    },
    <String, dynamic>{
      "question": "Combien de kilomètres par jour parcourez-vous en moyenne ?",
      "options": <String>["Moins de 10 kilomètres", " Entre 10 et 30 kilomètres", "Entre 30 et 50 kilomètres", "Plus de 50 kilomètres"]
    },
    <String, dynamic>{
      "question": "À quelle fréquence consommez-vous des produits locaux et de saison ?",
      "options": <String>["Toujours", "Souvent", "Parfois", "Rarement", "Jamais"]
    },
    <String, dynamic>{
      "question": "Utilisez-vous des appareils économes en énergie ?",
      "options": <String>["Oui, tous mes appareils sont économes en énergie.", "Certains de mes appareils sont économes en énergie.", "Non, aucun de mes appareils n'est économe en énergie."]
    },
    <String, dynamic>{
      "question": "Avez-vous réduit l'utilisation de plastique à usage unique ?",
      "options": <String>["Oui, j'ai considérablement réduit l'utilisation de plastique à usage unique.", "Certains de mes appareils sont économes en énergie.", "Non, aucun de mes appareils n'est économe en énergie."]
    }
  ];

  final List<Map<String, dynamic>> data = [
    {"title": "Voiture", "color": Colors.pinkAccent},
    {"title": "Avion", "color": Colors.pink},
    {"title": "Nourriture", "color": Colors.blue},
  ];

  final List<ChartData> chartData = [ChartData('Me', 12, 10, 14, 20, 30), ChartData('Tunisia', 14, 11, 18, 23, 30), ChartData('WorldWide', 16, 10, 15, 20, 30)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pagesController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _questions.length,
        itemBuilder: (BuildContext context, int index) => _currentIndex >= _questions.length
            ? Column(
                children: <Widget>[
                  Expanded(
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      series: <ChartSeries>[
                        StackedColumnSeries<ChartData, String>(dataSource: chartData, xValueMapper: (ChartData data, _) => data.x, yValueMapper: (ChartData data, _) => data.y1),
                        StackedColumnSeries<ChartData, String>(dataSource: chartData, xValueMapper: (ChartData data, _) => data.x, yValueMapper: (ChartData data, _) => data.y2),
                        StackedColumnSeries<ChartData, String>(dataSource: chartData, xValueMapper: (ChartData data, _) => data.x, yValueMapper: (ChartData data, _) => data.y3),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    spacing: 20,
                    runSpacing: 20,
                    children: <Widget>[
                      for (final Map<String, dynamic> map in data)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[Container(width: 10, height: 10, color: map["color"]), const SizedBox(width: 10), Text(map["title"], style: const TextStyle(fontSize: 14))],
                        )
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 80),
                  Padding(padding: const EdgeInsets.all(8.0), child: Text(_questions[index]["question"], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400))),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10),
                      itemCount: _questions[index]["options"].length,
                      itemBuilder: (BuildContext context, int indexJ) => InkWell(
                        highlightColor: transparent,
                        splashColor: transparent,
                        hoverColor: transparent,
                        onTap: () {
                          _currentIndex += 1;
                          if (_currentIndex >= _questions.length) {
                            setState(() {});
                          }
                          _pagesController.nextPage(duration: 500.ms, curve: Curves.linear);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.all(16),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: teal.withOpacity(.6)),
                          child: Text(_questions[index]["options"][indexJ], style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
