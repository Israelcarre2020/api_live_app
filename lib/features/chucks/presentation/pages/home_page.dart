import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di_manager/di_manager.dart';

import '../../domain/use_cases/get_chuck_use_case.dart';
import '../manager/chuck_cubit.dart';
import '../widgets/chuck_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ChuckCubit(getChuckUseCase: DIManager.getIt<GetChuckUseCase>()),
      child: const UsersListPageView(),
    );
  }
}

class UsersListPageView extends StatefulWidget {
  const UsersListPageView({super.key});

  @override
  State<UsersListPageView> createState() => _UsersListPageViewState();
}

const int chucksAmount = 20;

class _UsersListPageViewState extends State<UsersListPageView> {
  @override
  void initState() {
    _loadChucks(chucksAmount);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          centerTitle: true,
        ),
        body: BlocConsumer<ChuckCubit, ChuckState>(listener: (_, state) {
          state.maybeWhen(
            error: (message) {
              showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: const Text(
                          'Ups... we have an error getting the info, try again please'),
                      content: Text(message),
                    );
                  });
            },
            orElse: () {},
          );
        }, builder: (_, state) {
          return state.maybeWhen(
              loadedChucks: (chucks) =>
                  ChuckCard(chucks, () => _loadChucks(chucksAmount)),
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              orElse: () {
                return Center(
                  child: TextButton(
                      onPressed: () => _loadChucks(chucksAmount),
                      child: const Text('Load chucks')),
                );
              });
        }));
  }

  Future<void> _loadChucks(int chucksAmount) async {
    await context.read<ChuckCubit>().getChuckList(chucksAmount);
  }
}
