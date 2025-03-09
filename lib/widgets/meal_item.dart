import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_data.dart';
import 'package:meals_app/screens/meal_screen.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem(
      {super.key, required this.mealData, required this.onSelection});

  final Function onSelection;
  final MealData mealData;

  void onTap(context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MealScreen(
        mealData: mealData,
      ),
    ));
  }

  // --------- UI section ---------
  Widget renderIconWithText(icon, text) {
    String textStr = text.toString();
    String capitilizedText = textStr[0].toUpperCase() + textStr.substring(1);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon),
        SizedBox(
          width: 4,
        ),
        Text(
          capitilizedText,
          style: TextStyle().copyWith(color: Colors.white),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          onSelection(context, mealData);
        },
        child: Stack(
          children: [
            SizedBox(
                child: FadeInImage(
              width: double.infinity,
              height: 220,
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(mealData.imageUrl),
              fit: BoxFit.cover,
            )),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                    width: double.infinity,
                    color: const Color.fromARGB(129, 0, 0, 0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            softWrap: true,
                            mealData.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle().copyWith(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          spacing: 16,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            renderIconWithText(
                                Icons.timer_sharp, '${mealData.duration} min'),
                            renderIconWithText(
                                Icons.work, mealData.complexity.name),
                            renderIconWithText(
                                Icons.attach_money, mealData.affordability.name)
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
