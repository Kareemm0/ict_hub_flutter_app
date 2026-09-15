import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_hub_flutter/app_router.dart';
import 'package:ict_hub_flutter/app_theme.dart';
import 'package:ict_hub_flutter/theme_cubit.dart';
import 'package:ict_hub_flutter/theme_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: state.isDark
                ? AppTheme().darkTheme()
                : AppTheme().lighttheme(),
            routerConfig: AppRouter.appRouter,
          );
        },
      ),
    );
  }
}



/*
  Push/PushNamed           PushReplacment/Named.             Go/Gonamed
  1 > 2 (1,2).             1 => 2 => 3 (1,3)  [1,"" ,3]      1 => 2 => 3 (3) ,[3]


    home/serach?q=Resturant  
    home 
    seach 
    queyParam : {
    "q" : Resturant
    }             
 */





/*
Bloc vs cubit 
bisness Logic Component 


Bloc : 
   state 
   event 
   method 


Cubit: 
  state
  methods 



 */





/*
BlocProvider : 
BlocBuilder : 
BlocListener : 
BlocConsumer : 
BlocSelector : 

*/



/*
Api type : 
Reset Api ===> Working 
Graph Api 

 */



/*
CRUD => Create  , Read  , Update , Delete (CRUD operations)

Create => POST 
Read => GET 
Update => PUT , PACTCH
Delete => DELETE



Package => Dio 

*/