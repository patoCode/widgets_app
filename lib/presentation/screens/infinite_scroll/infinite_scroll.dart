import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5, 6];
  bool isLoading = false;
  bool isMounted = false;

  final ScrollController scrollController = ScrollController();

  Future<void> onReferesh() async {
    //await Future.delayed(const Duration(seconds: 3));
    if (!isMounted) return;

    isLoading = true;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveMore();
    isLoading = false;

    setState(() {});
  }

  void moveScrollToBottom() {
    // ** <scrollController.position.pixels> Indica el nro de pixeles que falta para llegar al final; Le sumamos 500 para darle una holgura y no llegue al final final , sino que se activa antes

    // **  <scrollController.position.maxScrollExtent> Indica lo maximo que podra 'scrollear'
    if (scrollController.position.pixels + 150 <=
        scrollController.position.maxScrollExtent) {
      scrollController.animateTo(
        scrollController.position.pixels + 120,
        duration: const Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  void addFiveMore() {
    final lastId = imagesIds.last;
    // ** Lo siguiente es igual que hacer
    /*  
      imagesIds.add(lastId+1);
      imagesIds.add(lastId+2);
      imagesIds.add(lastId+3);
      imagesIds.add(lastId+4);
      imagesIds.add(lastId+5);  
    */
    imagesIds.addAll(
      [1, 2, 3, 4, 5].map((e) => lastId + e),
    );
  }

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      // ** <scrollController.position.pixels> Indica el nro de pixeles que falta para llegar al final; Le sumamos 500 para darle una holgura y no llegue al final final , sino que se activa antes

      // **  <scrollController.position.maxScrollExtent> Indica lo maximo que podra 'scrollear'
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        // load next page
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async {
    // Si ya esta cargando el loading
    if (isLoading) return;
    isLoading = true;

    setState(() {});

    await Future.delayed(
      const Duration(seconds: 2),
    );
    addFiveMore();
    isLoading = false;

    if (isMounted) return;
    setState(() {});
    moveScrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Infinite Scroll"),
      // ),
      // ** <MediaQuery.removePadding> permite remover el espacio por defecto que se deja para algunos widgets propios del celular
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        // ** RefreshIndicator Permite hacer el swipe arriba para poder hacer refresh
        child: RefreshIndicator(
          onRefresh: onReferesh,
          // ** Para darle mas margin top al icono de refresh
          edgeOffset: 20,
          strokeWidth: 1,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity,
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage(
                    "https://picsum.photos/id/${imagesIds[index]}/500/300"),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        // child: const Icon(Icons.arrow_back_ios_rounded,),
        child: isLoading
            ? FadeIn(
                child: const Icon(
                  Icons.arrow_back_ios_rounded,
                ),
              )
            : SpinPerfect(
                infinite: true,
                child: FadeIn(
                  child: const Icon(
                    Icons.refresh_rounded,
                  ),
                ),
              ),
      ),
    );
  }
}
