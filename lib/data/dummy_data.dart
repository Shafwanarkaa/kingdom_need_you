import '../models/news_article.dart';

class DummyData {
  // --- NEWS ---
  static final List<NewsArticle> news = [
    NewsArticle(
      title: 'Man Utd Legends Return for Charity Match',
      author: 'John Doe',
      url:
          'https://www.manutd.com/en/news/detail/man-utd-legends-return-for-charity-match',
      urlToImage:
          'https://img.chelseafc.com/image/upload/f_auto,h_720,q_auto/embed/editorial/match-reports/2023-24/newcastle-v-chelsea-pl/Mount_celebrates_v_Newcastle_2324.jpg',
      publishedAt: DateTime.parse('2024-05-18T12:00:00Z'),
      content:
          'A host of club legends returned to Old Trafford on Saturday to participate in a special charity match, raising funds for the Manchester United Foundation. The likes of Wayne Rooney, Ryan Giggs, and Paul Scholes graced the pitch once more, delighting fans and contributing to a noble cause.',
    ),
    NewsArticle(
      title: 'Transfer Talk: United Eyeing New Midfielder',
      author: 'Jane Smith',
      url:
          'https://www.manutd.com/en/news/detail/transfer-talk-united-eyeing-new-midfielder',
      urlToImage:
          'https://assets.goal.com/v3/assets/bltcc7a7ffd2fbf71f5/blt4644a563f665cd4b/6280b33842c5a71025537613/GettyImages-1240417978.jpg',
      publishedAt: DateTime.parse('2024-05-17T09:30:00Z'),
      content:
          'Sources close to the club suggest that Manchester United are actively scouting for a new central midfielder to bolster their squad for the upcoming season. Several high-profile names have been linked with a potential move to Old Trafford as the summer transfer window approaches.',
    ),
    NewsArticle(
      title: 'Academy Stars Shine in FA Youth Cup Final',
      author: 'Emily White',
      url:
          'https://www.manutd.com/en/news/detail/academy-stars-shine-in-fa-youth-cup-final',
      urlToImage:
          'https://icdn.football-espana.net/wp-content/uploads/2024/05/Xavi-Simons-Barcelona.jpg',
      publishedAt: DateTime.parse('2024-05-16T20:00:00Z'),
      content:
          'Manchester United\'s U18s have lifted the FA Youth Cup after a thrilling victory at Old Trafford. The young Red Devils showcased immense talent and determination, with several players delivering standout performances that have fans excited for the future of the club.',
    ),
  ];

  // --- SQUAD (Updated with photos) ---
  static final List<Map<String, dynamic>> squad = [
    // Goalkeepers
    {
      'name': 'Altay Bayindir',
      'position': 'Goalkeeper',
      'number': '1',
      'image':
          'https://tmssl.akamaized.net/images/portrait/header/335619-1693832933.jpg',
    },
    {
      'name': 'Tom Heaton',
      'position': 'Goalkeeper',
      'number': '22',
      'image':
          'https://tmssl.akamaized.net/images/portrait/header/41250-1685021422.jpg',
    },
    {
      'name': 'Steven Lammens',
      'position': 'Goalkeeper',
      'number': '31',
      'image':
          'https://tmssl.akamaized.net/images/portrait/header/541203-1685023933.jpg',
    },

    // Defenders
    {
      'name': 'Matthijs de Ligt',
      'position': 'Defender',
      'number': '4',
      'image':
          'https://tmssl.akamaized.net/images/portrait/header/326031-1685022288.jpg',
    },
    {
      'name': 'Harry Maguire',
      'position': 'Defender',
      'number': '5',
      'image':
          'https://tmssl.akamaized.net/images/portrait/header/17761-1685021503.jpg',
    },
    {
      'name': 'Lisandro Martínez',
      'position': 'Defender',
      'number': '6',
      'image':
          'https://tmssl.akamaized.net/images/portrait/header/487615-1685021960.jpg',
    },
    {
      'name': 'Leny Yoro',
      'position': 'Defender',
      'number': '15',
      'image':
          'https://tmssl.akamaized.net/images/portrait/header/1012379-1699971037.jpg',
    },
    {
      'name': 'Luke Shaw',
      'position': 'Defender',
      'number': '23',
      'image':
          'https://tmssl.akamaized.net/images/portrait/header/183288-1685021647.jpg',
    },
    {
      'name': 'Ayden Heaven',
      'position': 'Defender',
      'number': '26',
      'image':
          'https://ballerupdates.com/wp-content/uploads/2024/02/Ayden-Heaven.jpg',
    },
    {
      'name': 'Tyler Fredricson',
      'position': 'Defender',
      'number': '33',
      'image':
          'https://thepeoplesperson.com/wp-content/uploads/2024/02/tyler-fredricson-man-utd-academy-1024x683.jpg',
    },
    {
      'name': 'Tyrell Malacia',
      'position': 'Defender',
      'number': '12',
      'image':
          'https://tmssl.akamaized.net/images/portrait/header/267615-1685021873.jpg',
    },
    {
      'name': 'Diego Leon',
      'position': 'Defender',
      'number': '35',
      'image': 'https://www.fifacm.com/content/media/players/24/281639.png',
    },
    {
      'name': 'Noussair Mazraoui',
      'position': 'Defender',
      'number': '3',
      'image':
          'https://tmssl.akamaized.net/images/portrait/header/257373-1685022212.jpg',
    },
    {
      'name': 'Diogo Dalot',
      'position': 'Defender',
      'number': '2',
      'image':
          'https://tmssl.akamaized.net/images/portrait/header/357155-1685021743.jpg',
    },
    {
      'name': 'Patrick Dorgu',
      'position': 'Defender',
      'number': '13',
      'image':
          'https://tmssl.akamaized.net/images/portrait/header/921536-1688632616.jpg',
    },

    // Midfielders
    {
      'name': 'Bruno Fernandes',
      'position': 'Midfielder',
      'number': '8',
      'image':
          'https://tmssl.akamaized.net/images/portrait/header/240306-1685021798.jpg',
    },
    {
      'name': 'Casemiro',
      'position': 'Midfielder',
      'number': '18',
      'image':
          'https://tmssl.akamaized.net/images/portrait/header/10256-1685021571.jpg',
    },
    {
      'name': 'Manuel Ugarte',
      'position': 'Midfielder',
      'number': '25',
      'image':
          'https://tmssl.akamaized.net/images/portrait/header/489980-1685350849.jpg',
    },
    {
      'name': 'Kobbie Mainoo',
      'position': 'Midfielder',
      'number': '37',
      'image':
          'https://tmssl.akamaized.net/images/portrait/header/798263-1708684742.jpg',
    },
    {
      'name': 'Mason Mount',
      'position': 'Midfielder',
      'number': '7',
      'image':
          'https://tmssl.akamaized.net/images/portrait/header/344111-1688632190.jpg',
    },

    // Forwards
    {
      'name': 'Amad',
      'position': 'Forward',
      'number': '16',
      'image':
          'https://tmssl.akamaized.net/images/portrait/header/536835-1685022135.jpg',
    },
    {
      'name': 'Matheus Cunha',
      'position': 'Forward',
      'number': '10',
      'image':
          'https://tmssl.akamaized.net/images/portrait/header/517892-1692886497.jpg',
    },
    {
      'name': 'Bryan Mbeumo',
      'position': 'Forward',
      'number': '19',
      'image':
          'https://tmssl.akamaized.net/images/portrait/header/399461-1692886733.jpg',
    },
    {
      'name': 'Shola Lacey',
      'position': 'Forward',
      'number': '61',
      'image':
          'https://thepeoplesperson.com/wp-content/uploads/2023/10/shea-lacey-man-utd-academy-1-e1697211116824.jpg',
    },
    {
      'name': 'Joshua Zirkzee',
      'position': 'Forward',
      'number': '11',
      'image':
          'https://tmssl.akamaized.net/images/portrait/header/435648-1709720333.jpg',
    },
    {
      'name': 'Benjamin Sesko',
      'position': 'Forward',
      'number': '30',
      'image':
          'https://tmssl.akamaized.net/images/portrait/header/628522-1688632408.jpg',
    },
    {
      'name': 'Chido Obi',
      'position': 'Forward',
      'number': '32',
      'image':
          'https://tmssl.akamaized.net/images/portrait/header/1004882-1715091726.jpg',
    },
  ];

  // --- FIXTURES ---
  static final List<Map<String, dynamic>> fixtures = [
    {
      'homeTeam': 'Aston Villa',
      'awayTeam': 'Man Utd',
      'date': '2025-12-21T15:00:00Z',
      'time': 'FT',
      'league': 'Premier League',
      'logoHome': 'assets/images/aston_villa.png',
      'logoAway':
          'https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Manchester_United_FC_crest.svg/1200px-Manchester_United_FC_crest.svg.png',
      'homeScore': 2,
      'awayScore': 1,
      'status': 'played',
    },
    {
      'homeTeam': 'Man Utd',
      'awayTeam': 'Newcastle',
      'date': '2025-12-27T15:00:00Z',
      'time': 'FT',
      'league': 'Premier League',
      'logoHome':
          'https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Manchester_United_FC_crest.svg/1200px-Manchester_United_FC_crest.svg.png',
      'logoAway':
          'https://upload.wikimedia.org/wikipedia/en/thumb/5/56/Newcastle_United_Logo.svg/1200px-Newcastle_United_Logo.svg.png',
      'homeScore': 1,
      'awayScore': 0,
      'status': 'played',
    },
    {
      'homeTeam': 'Man Utd',
      'awayTeam': 'Wolves',
      'date': '2025-12-31T15:00:00Z',
      'time': 'FT',
      'league': 'Premier League',
      'logoHome':
          'https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Manchester_United_FC_crest.svg/1200px-Manchester_United_FC_crest.svg.png',
      'logoAway': 'assets/images/wolves.png',
      'homeScore': 1,
      'awayScore': 1,
      'status': 'played',
    },
    {
      'homeTeam': 'Leeds',
      'awayTeam': 'Man Utd',
      'date': '2026-01-04T19:30:00Z',
      'time': 'FT',
      'league': 'Premier League',
      'logoHome':
          'https://upload.wikimedia.org/wikipedia/en/thumb/5/54/Leeds_United_F.C._logo.svg/1200px-Leeds_United_F.C._logo.svg.png',
      'logoAway':
          'https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Manchester_United_FC_crest.svg/1200px-Manchester_United_FC_crest.svg.png',
      'homeScore': 1,
      'awayScore': 1,
      'status': 'played',
    },
    {
      'homeTeam': 'Burnley',
      'awayTeam': 'Man Utd',
      'date': '2026-01-08T03:15:00Z',
      'time': '03:15',
      'league': 'Premier League',
      'logoHome': 'assets/images/burnley.png',
      'logoAway':
          'https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Manchester_United_FC_crest.svg/1200px-Manchester_United_FC_crest.svg.png',
      'status': 'NS',
    },
    {
      'homeTeam': 'Man Utd',
      'awayTeam': 'Brighton',
      'date': '2026-01-11T23:30:00Z',
      'time': '23:30',
      'league': 'FA Cup',
      'logoHome':
          'https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Manchester_United_FC_crest.svg/1200px-Manchester_United_FC_crest.svg.png',
      'logoAway':
          'https://upload.wikimedia.org/wikipedia/en/thumb/f/fd/Brighton_%26_Hove_Albion_logo.svg/1200px-Brighton_%26_Hove_Albion_logo.svg.png',
      'status': 'NS',
    },
    {
      'homeTeam': 'Man Utd',
      'awayTeam': 'Man City',
      'date': '2026-01-17T19:30:00Z',
      'time': '19:30',
      'league': 'Premier League',
      'logoHome':
          'https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Manchester_United_FC_crest.svg/1200px-Manchester_United_FC_crest.svg.png',
      'logoAway':
          'https://upload.wikimedia.org/wikipedia/en/thumb/e/eb/Manchester_City_FC_badge.svg/1200px-Manchester_City_FC_badge.svg.png',
      'status': 'NS',
    },
    {
      'homeTeam': 'Arsenal',
      'awayTeam': 'Man Utd',
      'date': '2026-01-25T23:30:00Z',
      'time': '23:30',
      'league': 'Premier League',
      'logoHome':
          'https://upload.wikimedia.org/wikipedia/en/thumb/5/53/Arsenal_FC.svg/1200px-Arsenal_FC.svg.png',
      'logoAway':
          'https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Manchester_United_FC_crest.svg/1200px-Manchester_United_FC_crest.svg.png',
      'status': 'NS',
    },
    {
      'homeTeam': 'Man Utd',
      'awayTeam': 'Fulham',
      'date': '2026-02-01T21:00:00Z',
      'time': '21:00',
      'league': 'Premier League',
      'logoHome':
          'https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Manchester_United_FC_crest.svg/1200px-Manchester_United_FC_crest.svg.png',
      'logoAway':
          'https://upload.wikimedia.org/wikipedia/en/thumb/e/eb/Fulham_FC_%28shield%29.svg/1200px-Fulham_FC_%28shield%29.svg.png',
      'status': 'NS',
    },
    {
      'homeTeam': 'Man Utd',
      'awayTeam': 'Tottenham',
      'date': '2026-02-07T19:30:00Z',
      'time': '19:30',
      'league': 'Premier League',
      'logoHome':
          'https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Manchester_United_FC_crest.svg/1200px-Manchester_United_FC_crest.svg.png',
      'logoAway':
          'https://upload.wikimedia.org/wikipedia/en/thumb/b/b4/Tottenham_Hotspur.svg/1200px-Tottenham_Hotspur.svg.png',
      'status': 'NS',
    },
    {
      'homeTeam': 'West Ham',
      'awayTeam': 'Man Utd',
      'date': '2026-02-11T03:15:00Z',
      'time': '03:15',
      'league': 'Premier League',
      'logoHome':
          'https://upload.wikimedia.org/wikipedia/en/thumb/c/c2/West_Ham_United_FC_logo.svg/1200px-West_Ham_United_FC_logo.svg.png',
      'logoAway':
          'https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Manchester_United_FC_crest.svg/1200px-Manchester_United_FC_crest.svg.png',
      'status': 'NS',
    },
  ];

  // --- STANDINGS ---
  static final List<Map<String, String>> leagues = [
    {'id': 'PL', 'name': 'Premier League'},
    {'id': 'CL', 'name': 'Champions League'},
  ];

  static final List<Map<String, String>> standingsPL = [
    {
      'intRank': '1',
      'strTeam': 'Arsenal',
      'strBadge':
          'https://upload.wikimedia.org/wikipedia/en/thumb/5/53/Arsenal_FC.svg/1200px-Arsenal_FC.svg.png',
      'intPlayed': '20',
      'intWin': '15',
      'intDraw': '3',
      'intLoss': '2',
      'intPoints': '48',
      'intGoalDifference': '+26',
      'strForm': 'W W W W L',
    },
    {
      'intRank': '2',
      'strTeam': 'Aston Villa',
      'strBadge': 'assets/images/aston_villa.png',
      'intPlayed': '20',
      'intWin': '13',
      'intDraw': '3',
      'intLoss': '4',
      'intPoints': '42',
      'intGoalDifference': '+9',
      'strForm': 'W W W L W',
    },
    {
      'intRank': '3',
      'strTeam': 'Manchester City',
      'strBadge':
          'https://upload.wikimedia.org/wikipedia/en/thumb/e/eb/Manchester_City_FC_badge.svg/1200px-Manchester_City_FC_badge.svg.png',
      'intPlayed': '19',
      'intWin': '13',
      'intDraw': '2',
      'intLoss': '4',
      'intPoints': '41',
      'intGoalDifference': '+26',
      'strForm': 'W W W W D',
    },
    {
      'intRank': '4',
      'strTeam': 'Liverpool',
      'strBadge':
          'https://upload.wikimedia.org/wikipedia/en/thumb/0/0c/Liverpool_FC.svg/1200px-Liverpool_FC.svg.png',
      'intPlayed': '20',
      'intWin': '10',
      'intDraw': '4',
      'intLoss': '6',
      'intPoints': '34',
      'intGoalDifference': '+4',
      'strForm': 'D W W W L',
    },
    {
      'intRank': '5',
      'strTeam': 'Manchester United',
      'strBadge':
          'https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Manchester_United_FC_crest.svg/1200px-Manchester_United_FC_crest.svg.png',
      'intPlayed': '20',
      'intWin': '9',
      'intDraw': '7',
      'intLoss': '4',
      'intPoints': '34',
      'intGoalDifference': '+4',
      'strForm': 'D L W D D',
    },
    {
      'intRank': '6',
      'strTeam': 'Chelsea',
      'strBadge':
          'https://upload.wikimedia.org/wikipedia/en/thumb/c/cc/Chelsea_FC.svg/1200px-Chelsea_FC.svg.png',
      'intPlayed': '19',
      'intWin': '8',
      'intDraw': '6',
      'intLoss': '5',
      'intPoints': '30',
      'intGoalDifference': '+11',
      'strForm': 'W D D L D',
    },
    {
      'intRank': '7',
      'strTeam': 'Brentford',
      'strBadge':
          'https://upload.wikimedia.org/wikipedia/en/thumb/2/2a/Brentford_FC_crest.svg/1200px-Brentford_FC_crest.svg.png',
      'intPlayed': '20',
      'intWin': '9',
      'intDraw': '3',
      'intLoss': '8',
      'intPoints': '30',
      'intGoalDifference': '+3',
      'strForm': 'L D W W W',
    },
    {
      'intRank': '8',
      'strTeam': 'Sunderland',
      'strBadge': 'assets/images/sunderland.png',
      'intPlayed': '20',
      'intWin': '7',
      'intDraw': '9',
      'intLoss': '4',
      'intPoints': '30',
      'intGoalDifference': '+2',
      'strForm': 'L D W D W',
    },
    {
      'intRank': '9',
      'strTeam': 'Brighton & Hove Albion',
      'strBadge':
          'https://upload.wikimedia.org/wikipedia/en/thumb/f/fd/Brighton_%26_Hove_Albion_logo.svg/1200px-Brighton_%26_Hove_Albion_logo.svg.png',
      'intPlayed': '20',
      'intWin': '7',
      'intDraw': '7',
      'intLoss': '6',
      'intPoints': '28',
      'intGoalDifference': '+3',
      'strForm': 'L D W D D',
    },
    {
      'intRank': '10',
      'strTeam': 'Crystal Palace',
      'strBadge': 'assets/images/crystal_palace.png',
      'intPlayed': '20',
      'intWin': '7',
      'intDraw': '7',
      'intLoss': '6',
      'intPoints': '28',
      'intGoalDifference': '+1',
      'strForm': 'W L L L D',
    },
    {
      'intRank': '11',
      'strTeam': 'Fulham',
      'strBadge':
          'https://upload.wikimedia.org/wikipedia/en/thumb/e/eb/Fulham_FC_%28shield%29.svg/1200px-Fulham_FC_%28shield%29.svg.png',
      'intPlayed': '20',
      'intWin': '8',
      'intDraw': '4',
      'intLoss': '8',
      'intPoints': '28',
      'intGoalDifference': '-1',
      'strForm': 'L W W L W',
    },
    {
      'intRank': '12',
      'strTeam': 'Everton',
      'strBadge':
          'https://upload.wikimedia.org/wikipedia/en/thumb/7/7c/Everton_FC_logo.svg/1200px-Everton_FC_logo.svg.png',
      'intPlayed': '20',
      'intWin': '8',
      'intDraw': '4',
      'intLoss': '8',
      'intPoints': '28',
      'intGoalDifference': '-1',
      'strForm': 'W W L L W',
    },
    {
      'intRank': '13',
      'strTeam': 'Tottenham Hotspur',
      'strBadge':
          'https://upload.wikimedia.org/wikipedia/en/thumb/b/b4/Tottenham_Hotspur.svg/1200px-Tottenham_Hotspur.svg.png',
      'intPlayed': '20',
      'intWin': '7',
      'intDraw': '6',
      'intLoss': '7',
      'intPoints': '27',
      'intGoalDifference': '+4',
      'strForm': 'W L L W D',
    },
    {
      'intRank': '14',
      'strTeam': 'Newcastle United',
      'strBadge':
          'https://upload.wikimedia.org/wikipedia/en/thumb/5/56/Newcastle_United_Logo.svg/1200px-Newcastle_United_Logo.svg.png',
      'intPlayed': '20',
      'intWin': '7',
      'intDraw': '6',
      'intLoss': '7',
      'intPoints': '27',
      'intGoalDifference': '+2',
      'strForm': 'D W L D D',
    },
    {
      'intRank': '15',
      'strTeam': 'AFC Bournemouth',
      'strBadge':
          'https://upload.wikimedia.org/wikipedia/en/thumb/e/e5/AFC_Bournemouth_%282013%29.svg/1200px-AFC_Bournemouth_%282013%29.svg.png',
      'intPlayed': '20',
      'intWin': '5',
      'intDraw': '8',
      'intLoss': '7',
      'intPoints': '23',
      'intGoalDifference': '-7',
      'strForm': 'D L D D L',
    },
    {
      'intRank': '16',
      'strTeam': 'Leeds United',
      'strBadge':
          'https://upload.wikimedia.org/wikipedia/en/thumb/5/54/Leeds_United_F.C._logo.svg/1200px-Leeds_United_F.C._logo.svg.png',
      'intPlayed': '20',
      'intWin': '5',
      'intDraw': '7',
      'intLoss': '8',
      'intPoints': '22',
      'intGoalDifference': '-7',
      'strForm': 'D W D D D',
    },
    {
      'intRank': '17',
      'strTeam': 'Nottingham Forest',
      'strBadge':
          'https://upload.wikimedia.org/wikipedia/en/thumb/e/e5/Nottingham_Forest_F.C._logo.svg/1200px-Nottingham_Forest_F.C._logo.svg.png',
      'intPlayed': '20',
      'intWin': '5',
      'intDraw': '3',
      'intLoss': '12',
      'intPoints': '18',
      'intGoalDifference': '-14',
      'strForm': 'W L L L L',
    },
    {
      'intRank': '18',
      'strTeam': 'West Ham United',
      'strBadge':
          'https://upload.wikimedia.org/wikipedia/en/thumb/c/c2/West_Ham_United_FC_logo.svg/1200px-West_Ham_United_FC_logo.svg.png',
      'intPlayed': '20',
      'intWin': '3',
      'intDraw': '5',
      'intLoss': '12',
      'intPoints': '14',
      'intGoalDifference': '-20',
      'strForm': 'L L L L D',
    },
    {
      'intRank': '19',
      'strTeam': 'Burnley',
      'strBadge': 'assets/images/burnley.png',
      'intPlayed': '20',
      'intWin': '3',
      'intDraw': '3',
      'intLoss': '14',
      'intPoints': '12',
      'intGoalDifference': '-19',
      'strForm': 'L D D L L',
    },
    {
      'intRank': '20',
      'strTeam': 'Wolverhampton Wanderers',
      'strBadge': 'assets/images/wolves.png',
      'intPlayed': '20',
      'intWin': '1',
      'intDraw': '3',
      'intLoss': '16',
      'intPoints': '6',
      'intGoalDifference': '-26',
      'strForm': 'L L L D W',
    },
  ];

  static final List<Map<String, dynamic>> shopItems = [
    {
      'id': '1',
      'name': 'Manchester United 25/26 Home Authentic Jersey',
      'price': 1688280.0,
      'image': 'assets/images/shop/homemunyuk.png',
      'description':
          'Few sporting stages can match the drama Manchester Uniteds iconic home ground has generated over the years. So this adidas authentic jersey pays tribute to the stadium in which it will be starring in 25/26 with a "Theatre of Dreams" sign-off and abstract Old Trafford-inspired graphics on the sleeves. Built for entertaining football, it also features a performance-focused build and a heat-applied club badge.',
      'sizes': ['S', 'M', 'L', 'XL', 'XXL'],
    },
    {
      'id': '2',
      'name': 'Manchester United 25/26 Away Authentic Jersey',
      'price': 1688280.0,
      'image': 'assets/images/shop/away_v2.png',
      'description':
          'Ice-cold Manchester United style finds a fresh look. It wont take fans long to see the influence of the clubs early-90s adidas snowflake kit on this authentic jersey. What are new, though, are those flashes of purple and lilac, and the metallic finish that gives the red devil badge extra lustre. This football shirt has a performance-focused build to keep players cool, calm and collected on the field.',
      'sizes': ['S', 'M', 'L', 'XL', 'XXL'],
    },
    {
      'id': '3',
      'name': 'Manchester United 25/26 Third Authentic Jersey',
      'price': 1969660.0,
      'image': 'assets/images/shop/third_v2.png',
      'description':
          'Part of a clean, classic adidas kit that will transport fans to a golden era. Finished in black, this Manchester United authentic third jersey conjures some of the clubs most iconic players and memorable away performances. A yellow Trefoil and club badge stand out on the chest while more subtle, devilish details are woven into the fabric. Lightweight and focused on performance, this eye-catching shirt was made to create new football memories.',
      'sizes': ['S', 'M', 'L', 'XL', 'XXL'],
    },
    {
      'id': '4',
      'name': 'Manchester United x adidas Home Scarf',
      'price': 539300.0,
      'image': 'assets/images/shop/scarf_v2.png',
      'description':
          'Show your devotion to Manchester United in classic style. Crafted from soft fabric, this adidas football scarf has engineered club details on both sides. The perfect accessory for match days at Old Trafford or for repping your team around town, it will keep you warm in their famous home colours.',
      'sizes': [], // Accessory, no size
    },
    {
      'id': '5',
      'name': 'Manchester United x adidas Home Club Ball Red',
      'price': 469000.0,
      'image': 'assets/images/shop/ball_v2.png',
      'description': 'Manchester United x adidas Home Club Ball Red.',
      'sizes': ['Size 5'], // Standard ball size usually
    },
    {
      'id': '6',
      'name': 'Manchester United Tiro 25 Competition Presentation Jacket',
      'price': 1758600.0,
      'image': 'assets/images/shop/training_v2.png',
      'description':
          'Focus on your football fandom in the adidas jacket Manchester United players wear when they talk to the media. Its smooth woven fabric is lined with soft mesh for a comfortable feel. Standing out from purple away kit colours, a woven crest has the final say as you stand with your team.',
      'sizes': ['S', 'M', 'L', 'XL', 'XXL'],
    },
    {
      'id': '7',
      'name': 'Manchester United Core Crest Flag Red',
      'price': 187600.0,
      'image': 'assets/images/shop/flag_v2.png',
      'description':
          'Decorate your space to show you are a true Manchester United fan with this flag. With the classic club crest on a bold, red background, this flag is an essential decoration to show your support for the team. Great for hanging in bedrooms, over desks, or in a cabinet, this flag’s iconic design shows your passion and team pride. 5 x 3',
      'sizes': [],
    },
    {
      'id': '8',
      'name': 'Manchester United 25/26 Goalkeeper Long Sleeve Shirt',
      'price': 1477210.0,
      'image': 'assets/images/shop/gk_v2.png',
      'description':
          'Fly fearlessly between the sticks in an adidas Manchester United goalkeeper jersey built with insights from pro players. Designed for keeper-specific movements, this long sleeve football shirt also includes moisture-managing AEROREADY to ensure nothing breaks your concentration. On the chest, a woven club badge shows whose colours youre defending.',
      'sizes': ['S', 'M', 'L', 'XL', 'XXL'],
    },
    {
      'id': '9',
      'name': 'Manchester United x Adidas Gazelle Black',
      'price': 2344800.00,
      'image': 'assets/images/shop/gazelle_v2.png',
      'description':
          'Step into a piece of 3-Stripes history while showing your football colours. Starring in signature details that include a soft suede upper, moulded tongue and T-toe, these adidas Gazelle shoes will keep you comfortable whether youre headed to the game or kicking back at home. Manchester Uniteds third kit colours and crest show who you follow.',
      'sizes': [
        '5',
        '5.5',
        '6',
        '6.5',
        '7',
        '7.5',
        '8',
        '8.5',
        '9',
        '9.5',
        '10',
        '10.5',
        '11',
        '11.5',
        '12',
        '12.5',
        '13',
      ],
    },
    {
      'id': '10',
      'name': 'Manchester United x adidas 25/26 Gloves Red',
      'price': 586200.00,
      'image': 'assets/images/shop/gloves.png',
      'description': 'Manchester United x adidas 25/26 Gloves Red',
    },
  ];
}
