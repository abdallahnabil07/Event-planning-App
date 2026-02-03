import 'package:flutter/material.dart';

import 'core/extensions/context_extensions.dart';
import 'custom_widget/app_bar_container_custom.dart';
import 'custom_widget/app_bar_title_custom_text.dart';

class EditEvent extends StatefulWidget {
  const EditEvent({super.key});

  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: CustomAppBarContainer(
          width: context.paddingWidth28,
          height: context.paddingHeight28,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: AppBarTitleCustomText(
          titleText: context.appLocalizations.event_edit,
        ),
      ),
    );
  }
}
