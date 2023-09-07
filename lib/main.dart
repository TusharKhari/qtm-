import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/auth_screen.dart';
import 'package:news_app/screens/feed_screen.dart';
import 'package:news_app/screens/providers/news_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';

//  59afb6110da4447581a5863c2e1ce4ee


  //  https://newsapi.org/v2/top-headlines?country=us&apiKey=59afb6110da4447581a5863c2e1ce4ee



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
   );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
       builder: (context, orientation, deviceType) {
        return  ChangeNotifierProvider(create: (context) => NewsProvider(), 
        child:   MaterialApp(
        //title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const NewsFeed(),
        // home: const AuthScreen()
                // home: const AuthScreen(),

      ),
        );
        
      
      },
    );
  }
}
 
 