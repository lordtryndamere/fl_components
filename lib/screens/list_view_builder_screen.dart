import 'package:fl_components/themes/app_theme.dart';
import 'package:flutter/material.dart';

class ListViewBuilderScreen extends StatefulWidget {
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {
  final List<int> imagesIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  @override //Ciclo de vida de cuando el estado se crea por primera vez en un widget
  void initState() {
    super.initState();
    scrollController.addListener(() {
      print(scrollController
          .position.pixels); // En donde se encuentra en la pantalla(Posicion actual)
      print(scrollController.position.maxScrollExtent); // Lo maximo que alcanza

      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  Future fetchData() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 3000));
    add();
    isLoading = false;
    setState(() {});

    //Para que solo mueva estando al final
    if(scrollController.position.pixels+100<=scrollController.position.minScrollExtent) return;


    //Mover el scroll mas abajo despues de cargar
    scrollController.animateTo(scrollController.position.pixels+120, duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
  }

  void add() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
    setState(() {});
  }
  //Function to do onRefresh
  Future<void> _onRefresh()   async {
    await Future.delayed(const Duration(milliseconds:2000));
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId+1);
    add();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Sabe el ancho  y el alto de la pantalla
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Stack(
          // Me permite poner widgets arriba de otros en forma de stack
          children: [
            RefreshIndicator(
              color: AppTheme.primary,
              onRefresh: _onRefresh,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                controller: scrollController,
                itemBuilder: (context, index) => FadeInImage(
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                    placeholder: const AssetImage('assets/jar-loading.gif'),
                    image: NetworkImage(
                        'https://picsum.photos/500/300?image=${imagesIds[index]}')),
                itemCount: imagesIds.length,
              ),
            ),
            if(isLoading)
            Positioned(
                bottom: 20,
                left: size.width * 0.5 - 30, // El 35 hace referencia a la mitad del tamaño del container
                child: 
                    const _LoadingIcon()) // Posicionar widget dentro de un stack
          ],
        ),
      ),
    );
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.91),
          shape: BoxShape.circle // Bordear
          ),
      child:  const CircularProgressIndicator.adaptive(
        valueColor:  AlwaysStoppedAnimation<Color>(AppTheme.primary)
      ),
    );
  }
}
