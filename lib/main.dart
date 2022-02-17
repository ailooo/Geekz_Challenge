import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geekz_challenge/bloc/all_news_bloc.dart';
import 'package:geekz_challenge/detail_news.dart';
import 'package:geekz_challenge/src/colors.dart';
import 'package:geekz_challenge/src/dimens.dart';

import 'data/service_locator.dart';

void main() async{
  runApp(const MyApp());
  await serviceLocator();

  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => AllNewsBloc(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AllNewsBloc? _allNewsBloc;

  @override
  void initState(){
    super.initState();
    _allNewsBloc = BlocProvider.of<AllNewsBloc>(context);

    _allNewsBloc!.add(GetAllNewsEvent());
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cGreen,
        title: const Text("Articles",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: widthInPercent(4, context), vertical: heightInPercent(2, context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("All Articles", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
            SizedBox(height: heightInPercent(2, context),),
            BlocBuilder(
              bloc: _allNewsBloc,
              builder: (_, state){
                if(state is LoadedAllNewsState){
                  return Expanded(
                    flex: 1,
                    child: ListView.separated(itemBuilder: (context, index){
                      var itemNews = state.result.articles[index];
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailNews(detailNews: itemNews,)));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: widthInPercent(2, context),
                          vertical: heightInPercent(2, context)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.15),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 5), // changes position of shadow
                              ),
                            ]
                          ),
                          child: Row(
                            children: [
                              Image.network(itemNews.urlToImage ?? "",
                                width: widthInPercent(20, context),fit: BoxFit.cover,
                                height: heightInPercent(15, context),
                              ),
                              SizedBox(width: widthInPercent(5, context),),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: widthInPercent(60, context),
                                    child: Text(itemNews.title ?? "-", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                      maxLines: 2,overflow: TextOverflow.ellipsis,),
                                  ),
                                  SizedBox(height: widthInPercent(1, context),),
                                  SizedBox(
                                    width: widthInPercent(60, context),
                                    child: Text(itemNews.title ?? "-", style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                                      maxLines: 4,overflow: TextOverflow.ellipsis,),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }, separatorBuilder: (context, index){
                      return SizedBox(height: heightInPercent(3, context),);
                    }, itemCount: state.result.articles.length),
                  );
                }
                else if(state is LoadingAllNewsState){
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.greenAccent,),
                  );
                }
                else if(state is ErrorAllNewsState){
                  return Center(child: Text(state.message ?? "Error", style: const TextStyle(color: Colors.black),),);
                }
                else {
                  return const SizedBox();
                }
              },
            )
          ],
        ),
      )
    );
  }
}
