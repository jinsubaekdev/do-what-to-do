import 'package:do_what_to_do/common/const/colors.dart';
import 'package:do_what_to_do/common/widgets/w_rounded_container.dart';
import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  final VoidCallback onPressed;

  const DeleteButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      child: const Icon(Icons.delete, color: AppColors.grey400, size: 32.0),
      onPressed: () {},
    );
  }
}
