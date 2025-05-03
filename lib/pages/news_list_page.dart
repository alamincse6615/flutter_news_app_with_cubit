import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_with_api_demo/cubit/news_cubit.dart';
import 'package:flutter_cubit_with_api_demo/cubit/news_cubit_state.dart';
import 'package:flutter_cubit_with_api_demo/pages/news_details_page.dart';

class NewsListPage extends StatefulWidget {
  const NewsListPage({super.key});

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NewsCubit>().getAllNews();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('News List'),
        actions: [
          IconButton(onPressed: (){context.read<NewsCubit>().getAllNews();}, icon: Icon(Icons.sync))
        ],
        centerTitle: true,
      ),
      body: BlocBuilder<NewsCubit, NewsCubitState>(
          builder: (context,state){
            if(state is NewsCubitLoading){
              return Center(child: CircularProgressIndicator(),);
            }else if(state is NewsCubitError){
              return Center(child: Text(state.message),);
            }else if(state is NewsCubitDataLoaded){
              return ListView.builder(
                  itemCount: state.newsList.length,
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsDetailsPage(model: state.newsList[index]),
                          ),
                        );
                      },
                      child: Card(
                        child: ListTile(
                          leading: Image.network(state.newsList[index].icon??''),
                          title: Text(state.newsList[index].name??''),
                          subtitle: Column(
                            children: [
                              Text(state.newsList[index].description??'',maxLines: 3,),
                              Text(state.newsList[index].lastFetch??''),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
              );
            }else{
              return Center(
                child: Text('Something went wrong'),
              );
            }

          }
      ),

    );
  }
  Widget body() {
    return BlocBuilder<NewsCubit, NewsCubitState>(
      builder: (context, state) {
        if (state is NewsCubitLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NewsCubitError) {
          return Center(child: Text(state.message));
        } else if (state is NewsCubitDataLoaded) {
          return ListView.separated(
            itemCount: state.newsList.length,
            padding: const EdgeInsets.all(16),
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final model = state.newsList[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => NewsDetailsPage(model: model),
                    ),
                  );
                },
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            model.icon ?? '',
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.image_not_supported),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model.name ?? '',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                model.description ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 6),
                              if (model.lastFetch != null)
                                Text(
                                  'Last updated: ${model.lastFetch}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: Colors.grey),
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }

}