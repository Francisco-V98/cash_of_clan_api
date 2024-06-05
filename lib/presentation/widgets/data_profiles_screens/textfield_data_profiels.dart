import 'package:flutter/material.dart';

class TextfieldDataProfiels extends StatelessWidget {
  const   TextfieldDataProfiels({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
            color: Color.fromARGB(255, 190, 114, 5),
            borderRadius: BorderRadius.all(Radius.circular(6)),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 8,
                color: Colors.black45 
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  height: 20,
                  width: 40,
                  color: Colors.black12,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward),
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}