class DummyData {
  static List<Map<String, dynamic>> fixtures = [
    {
      'date': '1/1',
      'homeTeam': 'Manchester United',
      'awayTeam': 'Arsenal',
      'homeScore': 2,
      'awayScore': 1,
      'time': '20:00',
      'league': 'Premier League',
      'isHome': true,
      'status': 'played',
      'logoHome': '',
      'logoAway': '',
    },
  ];

  static List<Map<String, dynamic>> squad = [
    {
      'id': '1',
      'name': 'David de Gea',
      'position': 'GK',
      'number': '1',
      'image': '',
    },
    {
      'id': '2',
      'name': 'Marcus Rashford',
      'position': 'FW',
      'number': '10',
      'image': '',
    },
  ];

  static List<Map<String, dynamic>> news = [
    {
      'title': 'Dummy: United win',
      'description': 'Manchester United won a friendly.',
      'image': '',
      'date': '1d ago',
      'source': 'Dummy News',
      'url': '',
    },
  ];

  // Products for Shop (dummy)
  static List<Map<String, dynamic>> products = [
    {
      'id': 'p1',
      'name': 'MU Home Shirt 2024',
      'price': 59.99,
      'image': 'https://via.placeholder.com/150',
      'description': 'Replica home shirt.',
    },
    {
      'id': 'p2',
      'name': 'MU Scarf',
      'price': 19.99,
      'image': 'https://via.placeholder.com/150',
      'description': 'Warm scarf.',
    },
  ];

  // Available leagues for standings selector
  static List<Map<String, String>> leagues = [
    {'id': 'PL', 'name': 'Premier League'},
    {'id': 'CL', 'name': 'Champions League'},
    {'id': 'FA', 'name': 'FA Cup'},
  ];

  // Simple standings sample (for Premier League)
  static List<Map<String, dynamic>> standingsPL = [
    {'rank': '1', 'team': 'Arsenal', 'points': '33'},
    {'rank': '2', 'team': 'Manchester City', 'points': '31'},
    {'rank': '12', 'team': 'Manchester United', 'points': '22'},
  ];
}
