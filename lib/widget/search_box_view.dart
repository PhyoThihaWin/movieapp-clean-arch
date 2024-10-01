import 'package:flutter/material.dart';
import 'package:movieapp_clean_arch/utils/context_ext.dart';

import '../resource/dimens.dart';

class SearchBoxView extends StatefulWidget {
  final bool enable;
  final Function(String value)? onChanged;

  const SearchBoxView({super.key, required this.enable, this.onChanged});

  @override
  State<SearchBoxView> createState() => _SearchBoxViewState();
}

class _SearchBoxViewState extends State<SearchBoxView> {
  late TextEditingController _editingController;

  @override
  void initState() {
    _editingController = TextEditingController();
    super.initState();

    _editingController.addListener(() {
      setState(() {
        widget.onChanged?.call(_editingController.text);
      });
    });
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: Dimens.MARGIN_MEDIUM_2),
      padding: const EdgeInsets.symmetric(horizontal: Dimens.MARGIN_MEDIUM_2),
      decoration: BoxDecoration(
        color: context.getColorScheme().surfaceContainerHighest,
        borderRadius:
            const BorderRadius.all(Radius.circular(Dimens.MARGIN_MEDIUM_2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.search,
          ),
          const SizedBox(
            width: Dimens.MARGIN_MEDIUM,
          ),
          Flexible(
            child: TextField(
              controller: _editingController,
              enabled: widget.enable,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Search",
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: Dimens.TEXT_REGULAR_2),
              ),
            ),
          ),
          _editingController.text.length > 2
              ? GestureDetector(
                  onTap: () {
                    _editingController.clear();
                  },
                  child: const Icon(
                    Icons.clear,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
