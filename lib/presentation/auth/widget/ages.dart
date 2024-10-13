import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/presentation/auth/bloc/age_display_cubit.dart';
import 'package:e_commerce_app/presentation/auth/bloc/age_display_state.dart';
import 'package:e_commerce_app/presentation/auth/bloc/age_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ages extends StatelessWidget {
  const Ages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.7,
      child: BlocBuilder<AgesDisplayCubit, AgesDisplayState>(
        builder: (context, state) {
          if (state is AgesLoading) {
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          }

          if (state is AgesLoadFailure) {
            return Container(
              alignment: Alignment.center,
              child: Text(state.message),
            );
          }

          if (state is AgesLoaded) {
            return _ages(state.ages);
          }

          return const SizedBox();
        },
      ),
    );
  }

  Widget _ages(List<QueryDocumentSnapshot<Map<String, dynamic>>> ages) {
    return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context);
              context.read<AgeSelectionCubit>().selectAge(
                    ages[index].data()['value'],
                  );
            },
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: ages.length);
  }
}
