
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_app/view/community/cubit/cubit.dart';
import 'package:mom_app/view/community/cubit/states.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/navigator.dart';

Future buildDialog(context,TextEditingController controller) {
  return showDialog(
    context: context,
    builder: (context) =>
        Dialog(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Create Group',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: 'Group name*',
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        AppNavigator.pop(context: context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.gray,
                      ),
                      child: const Text('cancel'),
                    ),
                    const SizedBox(width: 10),
                    BlocConsumer<CommunityCubit, CommunityStates>(
                      listener: (context, state) {
                        if(state is CreateGroupSuccess){
                          AppNavigator.pop(context: context);
                        }
                      },
                      builder: (context, state) {
                        var cubit = CommunityCubit.get(context);
                        return ElevatedButton(
                          onPressed: () {
                           if (controller.text.isNotEmpty) {
                             cubit.createGroup(
                                groupName: controller.text);
                           }
                          },
                          child: const Text('create'),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
  );
}
