import 'package:daily_recipe/constants/colors.dart';
import 'package:daily_recipe/views/filter_screen_view/filter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/icons.dart';
import '../../utils/images.dart';

class SearchBarWidget extends StatelessWidget {
  Function() ?  change;
   TextEditingController ? searchController;
   SearchBarWidget({super.key ,   this.change , this.searchController});

  @override
  Widget build(BuildContext context) {

    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
            //  width: double.infinity,
            decoration: BoxDecoration(
              color: llightGrey,
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextFormField(
              controller: searchController,
                cursorColor: ligthGrey,
                onChanged: (value){
                  searchController!.text = value;
                  change!();
                  
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: ligthGrey,
                    size: 25,
                  ),

                  // focusedBorder: UnderlineInputBorder(
                  //   borderSide: BorderSide( width: 1, color:  Colors.red),
                  // ),
                  hintText: "Search for recipes",

                  hintStyle: TextStyle(
                      color: ligthGrey,
                      fontSize: 15,
                      fontWeight: FontWeight.w300),
                  // enabledBorder: UnderlineInputBorder(
                  //   borderSide: BorderSide(width: 1, color:  ligthGrey),
                  // ),
                )),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        GestureDetector(
       
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>const FilterScreen()));
            },
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 17),
              decoration: BoxDecoration(
                color: llightGrey,
                borderRadius: BorderRadius.circular(15),
              ),
              child: SvgPicture.asset(
                IconPath.filterIcon,
                height: 22,
              )

              //  ImageIcon(
              //   AssetImage(
              //     ImagePath.filterIcon,
              //   ),
              //   size: 17,
              // )

              ),
        ),
      ],
    );
  }

// var _searchResult = [];
//   onSearchTextChanged(String text) async {
//     _searchResult.clear();
//     if (text.isEmpty) {
//       setState(() {});
//       return;
//     }

//     _userDetails.forEach((userDetail) {
//       if (userDetail.firstName.contains(text) || userDetail.lastName.contains(text))
//         _searchResult.add(userDetail);
//     });

//     setState(() {});
//   }
// }
}
