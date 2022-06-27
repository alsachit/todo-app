import 'package:flutter/material.dart';

class MessngerScreen extends StatelessWidget {
  const MessngerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Stack(
                            alignment: Alignment.topRight,
                            children: const [
                              CircleAvatar(
                                radius: 26,
                                backgroundImage: NetworkImage(
                                    'https://pbs.twimg.com/profile_images/1206582917922770946/CSC-YapS_400x400.jpg'),
                              ),
                              CircleAvatar(
                                radius: 11,
                                backgroundColor: Colors.black,
                              ),
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.red,
                                child: Text(
                                  "2",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Chats",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: CircleAvatar(
                              backgroundColor: Colors.grey.shade800,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: CircleAvatar(
                              backgroundColor: Colors.grey.shade800,
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 61, 61, 61),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 120,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => buildStoryItem(),
                        separatorBuilder: (context, index) => SizedBox(width: 20,),
                        itemCount: 10,
                      ),
                    ),
                    SizedBox(height: 20,),
                    ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                        itemBuilder: (context, index) => buildChatItem(),
                        separatorBuilder: (context, index) => SizedBox(height: 20,),
                        itemCount: 15
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildStoryItem() => Container(
    width: 70,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: const [
            CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(
                  'https://pbs.twimg.com/profile_images/1206582917922770946/CSC-YapS_400x400.jpg'),
            ),
            CircleAvatar(
              radius: 9,
              backgroundColor: Colors.black,
            ),
            CircleAvatar(
              radius: 8,
              backgroundColor: Colors.green,
            ),
          ],
        ),
        SizedBox(
          height: 7,
        ),
        Text(
          "Samer Kh. Alsachit",
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
  Widget buildChatItem() => Container(
    child: Row(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(
                  "https://pbs.twimg.com/profile_images/1206582917922770946/CSC-YapS_400x400.jpg"),
            ),
          ],
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hind Almousawi",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      'Hi my name is samer alsachit how are you doing now hahahaha',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Text(
                    " - 10:54 am",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
