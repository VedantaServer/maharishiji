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
        title: Text('New & Events'),
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is DataLoadingState) {
            return const CircularProgressIndicator(
              strokeWidth: 5,
              color: Colors.orange,
            );
          }
          if (state is DataLoadedSuccess) {
            List<NewsEventsModel> Lists = state.listModel;
            return ListView.separated(
              shrinkWrap: true,
              itemCount: Lists.length,
              separatorBuilder: (context, index) {
                return const Divider(height: 1, color: Colors.red,thickness: 1, );
              },
              itemBuilder: (context, index) {
                return ListTile(
                  tileColor: Colors.orange.shade400,
                  title: Text(
                    '${Lists[index].name}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  subtitle: Text(
                    '${Lists[index].description}',
                    style: const TextStyle(fontSize: 14),
                  ),
                );
              },
            );
          }
          if (state is DataLoadingErrorState) {
            return Text(state.msg);
          }
          return const Text("Something wrong");
        },
      ),

    );
  }
}
