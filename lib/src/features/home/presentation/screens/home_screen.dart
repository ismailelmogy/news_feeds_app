import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_feeds_app/src/core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/hex_color.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../widgets/article_widget.dart';
import '../../../../core/widgets/error_widget.dart' as error_widget;
import '../../../../core/widgets/loading_indicator.dart';
import '../bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  AnimationController? _animationController;
  late HomeBloc _homeBloc;

  _getAllArticles() => _homeBloc.add(GetArticlesEvent());

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    _getAllArticles();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      centerTitle: false,
      backgroundColor: HexColor("#141414"),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => _scaffoldKey.currentState!.openDrawer(),
      ),
      actions: [
        IconButton(
          icon: Image.asset(
            AppImages.search,
            height: 22,
            width: 22,
          ),
          onPressed: () {},
        ),
      ],
      title: const Text(
        "LINK DEVELOPMENT",
        style: TextStyle(
            fontWeight: FontWeight.w500, color: Colors.white, fontSize: 18),
      ),
    );
    return Scaffold(
        key: _scaffoldKey,
        drawer: AppDrawer(
          closeDrawer: () => _scaffoldKey.currentState!.closeDrawer(),
        ),
        backgroundColor: HexColor("#eeeeee"),
        appBar: appBar,
        body: RefreshIndicator(
            color: AppColors.primaryColor,
            onRefresh: () async => _getAllArticles(),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeIsLoading) {
                  return const LoadingIndicator();
                } else if (state is HomeError) {
                  return error_widget.ErrorWidget(
                      msg: state.message!,
                      onRetryPressed: () => _getAllArticles());
                } else if (state is HomeLoaded) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 20, right: 20, left: 20),
                    child: ListView.builder(
                        itemCount: state.articles.length,
                        itemBuilder: (context, index) {
                          int count = state.articles.length > 10
                              ? 10
                              : state.articles.length;
                          final Animation<double> animation =
                              Tween<double>(begin: 0.0, end: 1.0).animate(
                                  CurvedAnimation(
                                      parent: _animationController!,
                                      curve: Interval((1 / count) * index, 1.0,
                                          curve: Curves.fastOutSlowIn)));
                          _animationController?.forward();
                          return ArticleWidget(
                            article: state.articles[index],
                            animation: animation,
                            animationController: _animationController,
                          );
                        }),
                  );
                }
                return const LoadingIndicator();
              },
            )));
  }
}
