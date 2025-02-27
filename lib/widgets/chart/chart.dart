import 'package:expenses_app/cubit/cubit.dart';
import 'package:expenses_app/cubit/status.dart';
import 'package:expenses_app/models/expenses_model.dart';
import 'package:expenses_app/widgets/chart/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExpensesCubit,Status>(
      listener: (BuildContext context, Status state) {  },
      builder: (BuildContext context, Status state) {
        var cubit = ExpensesCubit.get(context);
        bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
        return  LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            print(constraints.minHeight);
            print(constraints.maxHeight);
            print(constraints.minWidth);
            print(constraints.maxWidth);
            return Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
              width: double.infinity,
              height: constraints.maxHeight*0.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(colors: [
                    Theme.of(context).colorScheme.primary.withOpacity(0.3),
                    Theme.of(context).colorScheme.primary.withOpacity(0.0),
                  ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter
                  )
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        for(var element in cubit.bucket)  ChartBar(fill: element.totalExpenses/cubit.maxExpenseTotal,),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Row(
                      children: cubit.bucket.map(
                            (toElement)=> Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: Icon(
                              categoryIcons[toElement.category],
                              color: isDark ?
                              Theme.of(context).colorScheme.onPrimary.withOpacity(0.7)
                                  :Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ).toList()
                  ),
                ],
              ),
            );
          },

        );
      },
    );
  }
}
