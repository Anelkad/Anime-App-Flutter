import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'api_client.dart';

class AnimeDetailsView extends StatelessWidget {
  late AnimeDetails animeDetails;

  AnimeDetailsView({required this.animeDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 19),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              animeDetails.url,
              width: double.infinity,
              height: 200.0,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            animeDetails.title,
            style: TextStyle(
              fontSize: 24,
              color: Color(0xFFE5E5E5),
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            animeDetails.rating,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFFE5E5E5),
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            animeDetails.synopsis,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFFE5E5E5),
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Color(0xFF6F4FA4)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11)),
                        backgroundColor: Color(0xFF393053)),
                    child: Text(
                      "Play",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFE5E5E5)),
                    ),
                  ),
                ),
                SizedBox(width: 37),
                Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(11), // Set corner radius here
                      ),
                      backgroundColor: Color(0xFF1A1A1A),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Download",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFE5E5E5)),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.download,
                          color: Color(0xFFE5E5E5),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              ColumnButton(
                icon: Icons.add,
                title: 'Add',
              ),
              ColumnButton(
                icon: Icons.thumb_up,
                title: 'Like',
              ),
              ColumnButton(
                icon: Icons.share,
                title: 'Share',
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ColumnButton extends StatelessWidget {
  late IconData icon;
  late String title;

  ColumnButton({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Color(0xFFE5E5E5),
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFE5E5E5)),
            )
          ],
        ),
      ),
    );
  }
}
