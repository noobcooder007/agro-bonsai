import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  final Widget form;
  const CustomBottomSheet({
    super.key,
    required this.form,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
      child: Column(
        children: [
          SizedBox(
            height: 40.0,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15.0),
                  height: 20.0,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(10.0),
                          right: Radius.circular(10.0))),
                  width: MediaQuery.sizeOf(context).width * 0.25,
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              child: form,
            ),
          )
        ],
      ),
    );
  }
}
