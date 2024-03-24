import 'package:flutter/material.dart';
import 'package:task_buddy/shared/global_font.dart';
import 'package:velocity_x/velocity_x.dart';

class PriorityChips extends StatelessWidget {
const PriorityChips({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    
      return Row(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: GlobalText(
                    textAlign: TextAlign.center,
                    text: 'Priority $index',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ).pOnly(right: 10);
              },
            ).h(35),
          ),
        ],
      );
    }
  }