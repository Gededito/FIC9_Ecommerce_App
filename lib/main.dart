import 'package:fic9_ecommerce_app/data/datasource/auth_local_datasource.dart';
import 'package:fic9_ecommerce_app/presentation/auth/bloc/login/login_bloc.dart';
import 'package:fic9_ecommerce_app/presentation/auth/bloc/register/register_bloc.dart';
import 'package:fic9_ecommerce_app/presentation/auth/login_page.dart';
import 'package:fic9_ecommerce_app/presentation/beranda/bloc/products/products_bloc.dart';
import 'package:fic9_ecommerce_app/presentation/cart/bloc/cart/cart_bloc.dart';
import 'package:fic9_ecommerce_app/presentation/cart/bloc/order/order_bloc.dart';
import 'package:fic9_ecommerce_app/presentation/dashboard/dashboard_page.dart';
import 'package:fic9_ecommerce_app/presentation/payment/bloc/order_detail/order_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) =>
              ProductsBloc()..add(const ProductsEvent.getAll()),
        ),
        BlocProvider(
          create: (context) => CartBloc(),
        ),
        BlocProvider(
          create: (context) => OrderBloc(),
        ),
        BlocProvider(
          create: (context) => OrderDetailBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true),
        home: FutureBuilder<bool>(
          future: AuthLocalDatasource().isLogin(),
          builder: (context, snapshot) {
            if (snapshot.data != null && snapshot.data!) {
              return const DashboardPage();
            } else {
              return const LoginPage();
            }
          },
        ),
      ),
    );
  }
}
