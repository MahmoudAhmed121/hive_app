import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_app/core/utils/constant.dart';
import 'package:hive_app/manager/notes/notes_cubit.dart';
import 'package:hive_app/model/note_model.dart';
import 'package:hive_app/simble_bloc_observer.dart';
import 'package:hive_app/views/nots_view.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  Bloc.observer = SimbleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NotesModelAdapter());
  await Hive.openBox<NotesModel>(kNotsBox);
  
  runApp(const HiveApp());
}

class HiveApp extends StatelessWidget {
  const HiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NotesCubit()..fetchAllNote(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
        ),
        home: NotsView(),
      ),
    );
  }
}
