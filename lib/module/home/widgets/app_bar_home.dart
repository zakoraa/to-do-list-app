import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/module/home/businessLogic/cubit/theme.dart';
import 'package:todoapp/shared/themes/color.dart';
import 'package:intl/intl.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  static const double heightAppBar = 150;

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    DateTime dateTime = DateTime.now();
    String formattedDate = DateFormat.yMMMd('en_US').format(dateTime);
    return Positioned(
      top: 0,
      left: 0,
      child: SizedBox(
        height: heightAppBar,
        width: MediaQuery.of(context).size.width - 40,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          formattedDate,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          "5 incomplete, 5 completed",
                          style: TextStyle(
                            color: CustomColor.secondaryTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 20),
                    child: BlocBuilder<ThemeCubit, ThemeState>(
                      builder: (context, state) => GestureDetector(
                        onTap: () => themeCubit.changeTheme(),
                        child: Image.asset(
                          state.isLight ? "assets/sun.png" : "assets/moon.png",
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                color: CustomColor.secondaryTextColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
