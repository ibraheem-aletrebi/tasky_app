import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/Feature/home/components/circler_user_image_widget.dart';
import 'package:tasky/Feature/layaout/controller/app_controller.dart';

class UserInformationWidget extends StatelessWidget {
  const UserInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<AppController>().change(3),
      child: Row(
        children: [
          CirclerUserImageWidget(),

          SizedBox(width: 8),
          SizedBox(
            width: 250,
            child:
                Selector<
                  AppController,
                  ({String userName, String motivationQuote})
                >(
                  builder: (BuildContext context, data, Widget? child) =>
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good Evening , ${data.userName}',
                            maxLines: 1,
                            style: TextTheme.of(context).titleMedium,
                          ),
                          Text(
                            '"${data.motivationQuote}"',
                            maxLines: 2,
                            style: TextTheme.of(context).titleSmall,
                          ),
                        ],
                      ),
                  selector: (context, appController) {
                    return (
                      userName: appController.userName,
                      motivationQuote: appController.motivationQoute,
                    );
                  },
                ),
          ),
        ],
      ),
    );
  }
}
