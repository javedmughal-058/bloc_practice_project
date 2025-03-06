import 'package:bloc_practice_project/bloc/news/news_bloc.dart';
import 'package:bloc_practice_project/bloc/news/news_event.dart';
import 'package:bloc_practice_project/bloc/news/news_state.dart';
import 'package:bloc_practice_project/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();

    // Add the listener to load more news when reaching the end of the list
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        context.read<NewsBloc>().add(FetchMoreNews(query: 'technology'));
      }
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context , title: 'Latest News'),
      body: RefreshIndicator(
        onRefresh: () async{
          context.read<NewsBloc>().add(FetchNews(query: 'technology'));
        },
        child: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is NewsInitial) {
              // Trigger fetching news on initial load
              context.read<NewsBloc>().add(FetchNews(query: 'technology'));
              return const Center(child: Text("Loading news..."));
            }
            else if (state is NewsLoading) {
              // Display loading indicator while data is being fetched
              return const Center(child: CircularProgressIndicator());
            }
            else if (state is NewsLoaded) {
              // Display news articles in a ListView
              return ListView.builder(
                controller: scrollController,
                padding: const EdgeInsets.all(16),
                itemCount: state.news.articles!.length + 1,
                itemBuilder: (context, index) {
                  if (index == state.news.articles!.length) {
                    return const Center(child: CircularProgressIndicator()); // Show loading indicator
                  }
                  final article = state.news.articles![index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade50,
                        ),
                      ]
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      children: [
                        article.urlToImage != null
                            ? Image.network(article.urlToImage!, height: 120, width: MediaQuery.sizeOf(context).width, fit: BoxFit.cover)
                            : const Icon(Icons.image),
                        const SizedBox(height: 5),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(article.title ?? "", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              const SizedBox(height: 5),
                              Text(article.description ?? ""),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(DateFormat('dd-MMM-yyyy').format(article.publishedAt!), style: const TextStyle(fontWeight: FontWeight.bold)),
                                  Expanded(child: Text("Source: ${article.source?.name ?? ""}", textAlign: TextAlign.right)),
                                ],
                              ),
                            ],
                          ),
                        )

                      ],
                    ),
                  );
                },
              );
            } else if (state is NewsError) {
              // Display error message with a retry button
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, color: Colors.red, size: 50),
                    const SizedBox(height: 16),
                    const Text(
                      "Failed to load news",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.message,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<NewsBloc>().add(FetchNews(query: 'technology'));
                      },
                      child: const Text("Retry"),
                    ),
                  ],
                ),
              );
            }
            return const Center(child: Text("Unknown state"));
          },
        ),
      ),
    );
  }
}
