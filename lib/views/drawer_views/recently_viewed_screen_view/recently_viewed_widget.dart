import 'package:daily_recipe/utils/images.dart';
import 'package:daily_recipe/views/components/star_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../models/recipe_model.dart';
import '../../../view_model/provider/recipes.provider.dart';

class RecentlyViewedItem extends StatelessWidget {
//   String? img;
//   String mealType;
//   String title;
//   String calories;
//   String serving;
// num ? rate;
//   String prepTime;
  final Recipe? recipe;
  RecentlyViewedItem(
      {super.key,
      // required this.mealType,
      // required this.title,
      // required this.calories,
      // required this.serving,
      // required this.prepTime,
      // required this.img,
      // required this.rate,
      required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 2,
        child: Container(
          height: 110,
          margin: EdgeInsets.symmetric(vertical: 6),
          width: MediaQuery.of(context).size.width,
          // height: 250,
          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),

          // width: MediaQuery.of(context).size.width,
          // margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
              color: llightGrey, borderRadius: BorderRadius.circular(18)),
          child: Padding(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 15, left: 15, right: 12),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(
                      recipe!.image!,
                      height: 120,
                      width: 70,
                      fit: BoxFit.contain,
                    ),
                    // Image.asset(
                    //   recommendedImg!,
                    //   height: 70,
                    //   fit: BoxFit.cover,
                    // ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recipe!.meal_type!,
                          // "Breakfast",
                          style: TextStyle(
                              fontSize: 13,
                              color: deepGreen,
                              fontWeight: FontWeight.w400),
                        ),
                        Flexible(
                          child: Text(
                            recipe!.title!.length > 23
                                ? recipe!.title!.substring(0, 23) + "..."
                                : recipe!.title!,

                            // de"French Toast with Berries",
                            // maxLines: 1,
                            //overflow: TextOverflow.ellipsis,
                            // "French Toast with Berries",
                            style: const TextStyle(
                                decorationStyle: TextDecorationStyle.dotted,
                                // overflow: TextOverflow.ellipsis,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        //  const SizedBox(
                        //   height: 3,
                        // ),
                        Row(children: [
                          RatingBarIndicator(
                            // ignoreGestures: true,
                            rating: recipe!.rating! as double,
                            // initialRating: 4,
                            // minRating: 1,
                            direction: Axis.horizontal,
                            // allowHalfRating: true,
                            // updateOnDrag: false,
                            unratedColor: Colors.grey,
                            itemCount: 5,
                            itemSize: 18,
                            itemBuilder: (context, _) => const StarWidget(),
                            //  onRatingUpdate: (double value) {},
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "${recipe!.calories} Calories",
                            // "120 Calories",
                            style: TextStyle(
                                color: deepOrange,
                                fontSize: 8,
                                fontWeight: FontWeight.w300),
                          ),
                        ]),
                        // const SizedBox(
                        //   height: 6,
                        // ),

                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            // ImageIcon(
                            //   AssetImage(
                            //     ImagePath.timeIcon,
                            //   ),
                            //),

                            const Icon(
                              Icons.access_time,
                              size: 15,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text("${recipe!.prep_time} mins",
                                //"15 mins",
                                style: TextStyle(
                                  color: ligthGrey,
                                  fontSize: 12,
                                )),
                            // ImageIcon(
                            //   AssetImage(
                            //     ImagePath.servingIcon,
                            //   ),
                            // ),
                            const SizedBox(
                              width: 32,
                            ),
                            const Icon(
                              Icons.room_service_outlined,
                              size: 15,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text("${recipe!.serving} Serving",
                                style: TextStyle(
                                  color: ligthGrey,
                                  fontSize: 12,
                                ))
                          ],
                        )
                      ],
                    ),
                    const Spacer(),

                    GestureDetector(
                      onTap: () {
                        Provider.of<RecipesProvider>(context, listen: false)
                            .removeRecipeToUserRecentlyViewed(
                          recipe!.docId!);
                           !(recipe?.recently_viewd_users_ids?.contains(
                                   FirebaseAuth.instance.currentUser?.uid) ??
                               false);
                       
                      },
                      child: 
                      // (recipe?.recently_viewd_users_ids?.contains(
                      //             FirebaseAuth.instance.currentUser?.uid) ??
                      //         false
                         // ? 
                           Icon(
                              Icons.remove_circle_outlined,
                              size: 30,
                              color: Colors.red,
                            )
                          // : Icon(
                          //     Icons.remove_circle_outlined,
                          //     size: 30,
                          //     color: ligthGrey,
                          //   )
                          ),
                      // GestureDetector(
                      //   onTap: () {},
                      //   child: Icon(
                      //     Icons.favorite_outline,
                      //     color: ligthGrey,
                      //     // size: 30,
                      //   ),
                      // ),
                      //]),
                    
                  ])),
        ));
  }
}