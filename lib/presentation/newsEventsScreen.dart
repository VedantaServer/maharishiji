import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maharishiji/data/bloc/new-and-events-bloc.dart';
import 'package:maharishiji/data/models/new-and-events.dart';

class NewsEventScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<NewsBloc>(
      create: (context) => NewsBloc(DataLoadingState())..add(DataLoading()),
      child: NewsEventScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('New & Events'),
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is DataLoadingState) {
            return SizedBox(
                height: MediaQuery.of(context).size.height / 1.3,
                child: Center(
                    child: CircularProgressIndicator(
                  strokeWidth: 5,
                  color: Colors.orange,
                )));
          }
          if (state is DataLoadedSuccess) {
            List<NewsEventsModel> Lists = state.listModel;
            return ListView.separated(
              shrinkWrap: true,
              itemCount: Lists.length,
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 1,
                  color: Colors.white,
                  thickness: 1,
                );
              },
              itemBuilder: (context, index) {
                return ListTile(
                  tileColor: Colors.orange.shade400,
                  leading: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 44,
                      minHeight: 44,
                      maxWidth: 64,
                      maxHeight: 64,
                    ),
                    child: Image.network(
                        'https://maharishiji.net/image/${Lists[index].image}',
                        fit: BoxFit.cover),
                  ),
                  title: Text(
                    '${Lists[index].name}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                    '${Lists[index].description}',
                    style: const TextStyle(fontSize: 14),
                  ),
                  trailing: Text(
                    '${Lists[index].updationDate}',
                    style: const TextStyle(fontSize: 5),
                  ),
                );
              },
            );
          }
          if (state is DataLoadingErrorState) {
            return SizedBox(
                height: MediaQuery.of(context).size.height / 1.3,
                child: Center(
                    child: Text(
                  state.msg,
                  style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 25,
                      color: Colors.red),
                )));
          }
          return const Text("Something wrong");
        },
      ),
    );
  }
}
