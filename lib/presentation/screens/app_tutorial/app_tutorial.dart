import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlidesInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlidesInfo(
    this.title,
    this.caption,
    this.imageUrl,
  );
}

final slides = <SlidesInfo>[
  SlidesInfo(
    'Busca la comida',
    'Excepteur in magna aliqua sint deserunt culpa in consectetur ipsum aute anim anim dolor.',
    'assets/images/1.png',
  ),
  SlidesInfo(
    'Busca Entrega rapida',
    'Enim excepteur nisi Lorem adipisicing irure velit.',
    'assets/images/2.png',
  ),
  SlidesInfo(
    'Disfruta la comida',
    'Cillum elit dolor qui eiusmod ut.',
    'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endTutorial = false;

  @override
  void initState() {
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endTutorial && page >= (slides.length - 1.5)) {
        setState(() {
          endTutorial = true;
        });
      }
    });
    super.initState();
  }

  // ** Como buena practica siempre se debe llamar el metodo dispose cuando se utiliza StatefulWidgets y Listeners [controllers]
  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            children: slides
                .map(
                  (slideData) => _Slide(
                    caption: slideData.caption,
                    title: slideData.title,
                    imageUrl: slideData.imageUrl,
                  ),
                )
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text("Salir"),
              onPressed: () => context.pop(),
            ),
          ),
          endTutorial
              ? Positioned(
                  bottom: 20,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      child: const Text("Comenzar"),
                      onPressed: () => context.pop(),
                    ),
                  ),
                )
              // ** uso sizedbox porque no quiero mostrar ningun widget
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        // ** El mainAxisAlignment alinea los elementos al centro de manera vertical
        mainAxisAlignment: MainAxisAlignment.center,
        // ** El crossAxisAlignment alinea los elementos al centro de manera horizontal
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(imageUrl),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: titleStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            caption,
            style: captionStyle,
          ),
        ],
      ),
    );
  }
}
