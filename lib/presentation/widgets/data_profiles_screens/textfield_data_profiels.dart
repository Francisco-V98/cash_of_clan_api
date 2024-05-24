import 'package:flutter/material.dart';

class TextfieldDataProfiels extends StatelessWidget {
  const TextfieldDataProfiels({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          SizedBox(
            height: 40,
            width: 252,
            child: TextFormField(
              decoration: InputDecoration(
                hintStyle: const TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.w500),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.grey, width: 1.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 190, 114, 5),
                      width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 190, 114, 5),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.send),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}