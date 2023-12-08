import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:word_weather/utils/globals.dart';

class Acts extends StatefulWidget {
  const Acts({super.key});

  @override
  State<Acts> createState() => _ActsState();
}

class _ActsState extends State<Acts> {
  int _index = 0;
  final GlobalKey<State> _tabKey = GlobalKey<State>();
  final PageController _actionsController = PageController();

  @override
  void dispose() {
    _actionsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = <Widget>[
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                const Text("See all the actions", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                const Spacer(),
                IconButton(onPressed: () {}, icon: const Icon(FontAwesome.magnifying_glass, size: 15)),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.sizeOf(context).width - 24 * 2,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: teal.withOpacity(.8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text("All Actions", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                  const SizedBox(height: 10),
                  const Flexible(child: Text("Start with small steps to have big impact", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: white.withOpacity(.6)),
                    child: const Text("178 Actions", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text("See the categories (9)", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 10),
                itemCount: 4,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => Container(
                  width: MediaQuery.sizeOf(context).width - 24 * 2,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: teal.withOpacity(.8), image: DecorationImage(image: AssetImage("assets/$index.png"), fit: BoxFit.cover)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text("All Actions", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                      const SizedBox(height: 10),
                      const Flexible(child: Text("Start with small steps to have big impact", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: white.withOpacity(.6)),
                        child: const Text("178 Actions", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text("See the collections (6)", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 10),
                itemCount: 4,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => Container(
                  width: MediaQuery.sizeOf(context).width - 24 * 2,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: teal.withOpacity(.8), image: DecorationImage(image: AssetImage("assets/$index.png"), fit: BoxFit.cover)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text("All Actions", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                      const SizedBox(height: 10),
                      const Flexible(child: Text("Start with small steps to have big impact", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: white.withOpacity(.6)),
                        child: const Text("178 Actions", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text("See the recommandations (5)", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
            const SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 10),
                itemCount: 4,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.sizeOf(context).width - 24 * 2,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: teal.withOpacity(.8), image: DecorationImage(image: AssetImage("assets/$index.png"), fit: BoxFit.cover)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Text("All Actions", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                          const SizedBox(height: 10),
                          const Flexible(child: Text("Start with small steps to have big impact", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))),
                          const SizedBox(height: 30),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: white.withOpacity(.6)),
                            child: const Text("178 Actions", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Flexible(child: Text("Start with small steps to have big impact", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))),
                    const SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        const Text("30", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                        const SizedBox(width: 10),
                        for (int index = 0; index < 5; index++) Icon(FontAwesome.chevron_right, size: 13, color: index > 3 ? gray : teal),
                        const SizedBox(width: 10),
                        const Text("Medium", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[],
            )
          ],
        ),
      ),
    ];
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          StatefulBuilder(
            key: _tabKey,
            builder: (BuildContext context, void Function(void Function()) _) {
              return Row(
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        if (_index != 0) {
                          _actionsController.animateToPage(0, curve: Curves.linear, duration: 700.ms);
                          _(() => _index = 0);
                        }
                      },
                      child: Column(
                        children: <Widget>[
                          AnimatedContainer(
                            padding: const EdgeInsets.all(16),
                            duration: 700.ms,
                            color: _index == 0 ? teal.withOpacity(.3) : null,
                            child: const Center(child: Text("Actions", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))),
                          ),
                          AnimatedContainer(height: _index == 0 ? 1 : 0, duration: 700.ms, color: teal),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        if (_index != 1) {
                          _actionsController.animateToPage(1, curve: Curves.linear, duration: 700.ms);
                          _(() => _index = 1);
                        }
                      },
                      child: Column(
                        children: <Widget>[
                          AnimatedContainer(
                            padding: const EdgeInsets.all(16),
                            duration: 700.ms,
                            color: _index == 1 ? teal.withOpacity(.3) : null,
                            child: const Center(child: Text("My Actions", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))),
                          ),
                          AnimatedContainer(height: _index == 1 ? 1 : 0, duration: 700.ms, color: teal),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Expanded(
            child: PageView.builder(
              itemCount: 1,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) => pages[index],
              onPageChanged: (int value) => _tabKey.currentState!.setState(() => _index = value),
              controller: _actionsController,
            ),
          ),
        ],
      ),
    );
  }
}
