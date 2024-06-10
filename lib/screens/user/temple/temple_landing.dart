import 'package:flutter/material.dart';

class TempleLandingPage extends StatefulWidget {
  @override
  _TempleLandingPageState createState() => _TempleLandingPageState(
        templeDataTitles: [
          'History',
          'About',
          'Booking',
          'Location',
          'Contact',
          'Opening Times',
          'Pariharams',
          'Other Gods',
          'Festivals',
          'Videos',
        ],
        templeDataContents: [
          "Arulmigu Meenakshi Sundareswarar Temple, also known as Arulmigu Meenakshi Amman Thirukkovil, is a historic Hindu temple located on the southern bank of the Vaigai River in the temple city of Madurai, Tamil Nadu, India. It is dedicated to the goddess Meenakshi, a form of Parvati, and her consort, Sundareshwarar, a form of Shiva. The temple is at the centre of the ancient temple city of Madurai mentioned in the Tamil Sangam literature, with the goddess temple mentioned in 6th-century CE texts. This temple is one of the Paadal Petra Sthalams, which are 275 temples of Shiva that are revered in the verses of Tamil Saiva Nayanars of the 6th-9th century CE. The west tower (gopuram) of the temple is the model based on which the Tamil Nadu State Emblem is designed.",
          "The Meenakshi Amman Temple in Madurai, Tamil Nadu, is a masterpiece of Dravidian architecture, adorned with vibrant sculptures and towering gopurams. Dedicated to goddess Meenakshi and her consort Sundareswarar, it's a revered pilgrimage site and UNESCO World Heritage Site, hosting colorful festivals like the Meenakshi Thirukalyanam. With a history spanning over 2,000 years and intricate details reflecting Hindu mythology, it's a cultural jewel of South India, drawing devotees and tourists alike.",
          'Options for booking services...',
          "The Meenakshi Amman Temple is located in the city of Madurai, Tamil Nadu, India. Specifically, it is situated in the southern bank of the Vaigai River in the heart of Madurai's old town. The temple's precise address is: Meenakshi Amman Temple, Madurai Main, Madurai, Tamil Nadu 625001, India.",
          "Meenakshi Amman Temple,Madurai Main,Madurai,Tamil Nadu 625001,\nIndia.\nPhone:+91 (452) 234 4360",
          'Meenakshi temple is from 5 AM to 12.30 PM. It again opens for darshan at 4 PM to 9.30 PM.',
          "1.Abhishekam: This ritual involves the ceremonial bathing of the main deities, Meenakshi and Sundareswarar, with water, milk, honey, and other sacred substances.\n 2. Alankaram: The deities are adorned with different types of attire and jewelry during this ritual, enhancing their divine appearance.\n 3. Arati: Arati is the waving of lit oil lamps before the deities as a form of worship, accompanied by chanting of hymns and mantras.\n 4.Panchamritam: This ritual involves offering a mixture of five sacred ingredients (milk, curd, ghee, honey, and sugar) to the deities.\n 5. Theertham: Devotees partake in the ceremonial drinking of the temple's holy water, known as theertham, believed to have purifying properties. \n 6. Processions: During festivals and special occasions, the temple conducts elaborate processions of the deities around the temple complex and the city streets, accompanied by music, dance, and devotional fervor. \n 7. Special Poojas: The temple also conducts special poojas on auspicious days, festivals, and during Navaratri, attracting large crowds of devotees.",
          '1.Lord Vishnu\n 2.Lord Ganesha\n 3.Lord Murugan (Kartikeya)\n 4.Navagrahas\n 5.Nataraja\n 6.Saptha Matha\n 7.Goddess Durga',
          '1.Meenakshi Thirukalyanam\n 2.Chithirai Thiruvizha\n 3.Navaratri\n 4.Float Festival (Teppam Festival)\n 5.Aadi Perukku\n 6.Panguni Uthiram\n 7.Puthu Mandapam Festival',
          'Link or details about temple-related videos...',
        ],
      );
}

class _TempleLandingPageState extends State<TempleLandingPage> {
  final List<String> templeDataTitles;
  final List<String> templeDataContents;

  _TempleLandingPageState({
    required this.templeDataTitles,
    required this.templeDataContents,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Meenakshi Amman Temple'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Image.asset(
              'assets/images/body/temple.png',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 5),
            DefaultTabController(
              length: templeDataTitles.length,
              child: Column(
                children: [
                  TabBar(
                    isScrollable: true,
                    labelColor: Colors.black54,
                    unselectedLabelColor: Colors.black,
                    indicatorColor: Colors.black54,
                    tabs: templeDataTitles
                        .map((title) => Tab(
                              text: title,
                            ))
                        .toList(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 280,
                    child: TabBarView(
                      children: templeDataContents
                          .map(
                            (content) => SingleChildScrollView(
                              // controller: ScrollController(),
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Card(
                                  color: Colors.yellow[300],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text(
                                          templeDataTitles[templeDataContents
                                              .indexOf(content)],
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.justify,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          content,
                                          style: TextStyle(fontSize: 18),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}