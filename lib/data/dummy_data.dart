
import '../models/news_article.dart';

class DummyData {
  // --- NEWS ---
  static final List<NewsArticle> news = [
    NewsArticle(
      title: 'Man Utd Legends Return for Charity Match',
      author: 'John Doe',
      url: 'https://www.manutd.com/en/news/detail/man-utd-legends-return-for-charity-match',
      urlToImage:
          'https://img.chelseafc.com/image/upload/f_auto,h_720,q_auto/embed/editorial/match-reports/2023-24/newcastle-v-chelsea-pl/Mount_celebrates_v_Newcastle_2324.jpg',
      publishedAt: DateTime.parse('2024-05-18T12:00:00Z'),
      content:
          'A host of club legends returned to Old Trafford on Saturday to participate in a special charity match, raising funds for the Manchester United Foundation. The likes of Wayne Rooney, Ryan Giggs, and Paul Scholes graced the pitch once more, delighting fans and contributing to a noble cause.',
    ),
    NewsArticle(
      title: 'Transfer Talk: United Eyeing New Midfielder',
      author: 'Jane Smith',
      url: 'https://www.manutd.com/en/news/detail/transfer-talk-united-eyeing-new-midfielder',
      urlToImage:
          'https://assets.goal.com/v3/assets/bltcc7a7ffd2fbf71f5/blt4644a563f665cd4b/6280b33842c5a71025537613/GettyImages-1240417978.jpg',
      publishedAt: DateTime.parse('2024-05-17T09:30:00Z'),
      content:
          'Sources close to the club suggest that Manchester United are actively scouting for a new central midfielder to bolster their squad for the upcoming season. Several high-profile names have been linked with a potential move to Old Trafford as the summer transfer window approaches.',
    ),
    NewsArticle(
      title: 'Academy Stars Shine in FA Youth Cup Final',
      author: 'Emily White',
      url: 'https://www.manutd.com/en/news/detail/academy-stars-shine-in-fa-youth-cup-final',
      urlToImage:
          'https://icdn.football-espana.net/wp-content/uploads/2024/05/Xavi-Simons-Barcelona.jpg',
      publishedAt: DateTime.parse('2024-05-16T20:00:00Z'),
      content:
          'Manchester United\'s U18s have lifted the FA Youth Cup after a thrilling victory at Old Trafford. The young Red Devils showcased immense talent and determination, with several players delivering standout performances that have fans excited for the future of the club.',
    ),
  ];

  // --- SQUAD ---
  static final List<Map<String, String>> squad = [
    {'name': 'André Onana', 'position': 'Goalkeeper', 'number': '24'},
    {'name': 'Diogo Dalot', 'position': 'Defender', 'number': '20'},
    {'name': 'Lisandro Martínez', 'position': 'Defender', 'number': '6'},
    {'name': 'Harry Maguire', 'position': 'Defender', 'number': '5'},
    {'name': 'Aaron Wan-Bissaka', 'position': 'Defender', 'number': '29'},
    {'name': 'Kobbie Mainoo', 'position': 'Midfielder', 'number': '37'},
    {'name': 'Bruno Fernandes', 'position': 'Midfielder', 'number': '8'},
    {'name': 'Scott McTominay', 'position': 'Midfielder', 'number': '39'},
    {'name': 'Alejandro Garnacho', 'position': 'Forward', 'number': '17'},
    {'name': 'Rasmus Højlund', 'position': 'Forward', 'number': '11'},
    {'name': 'Marcus Rashford', 'position': 'Forward', 'number': '10'},
  ];

  // --- SHOP (UPDATED) ---
  static final List<Map<String, dynamic>> shopItems = [
    {
      'id': 'item_001',
      'name': 'Home Kit 2023/24',
      'price': 75.00,
      'image': 'https://store.manutd.com/content/ws/all/92053423-747f-4447-9896-107577239c4a-800.png',
      'sizes': ['S', 'M', 'L', 'XL'],
    },
    {
      'id': 'item_002',
      'name': 'Away Kit 2023/24',
      'price': 75.00,
      'image': 'https://images.footballfanatics.com/manchester-united/manchester-united-away-shirt-2023-24_ss5_p-13374826+pv-1+u-whikzoplnj8ohqjhgkbk+v-nodxom2ylz2rslueuyj7.jpg?_s=bm-pi-276639-2165',
      'sizes': ['S', 'M', 'L'],
    },
    {
      'id': 'item_003',
      'name': 'Garnacho \'Fearless\' Poster',
      'price': 15.50,
      'image': 'https://i.ebayimg.com/images/g/q1cAAOSwserk4~a1/s-l1600.jpg',
      'sizes': [],
    },
    {
      'id': 'item_004',
      'name': 'Old Trafford Scarf',
      'price': 20.00,
      'image': 'https://store.manutd.com/content/ws/all/0f2a781d-1577-4cfb-810a-289524f0c766-800.png',
      'sizes': [],
    },
    {
      'id': 'item_005',
      'name': 'Team Crest Mug',
      'price': 12.00,
      'image': 'https://store.manutd.com/content/ws/all/a71c26b5-e6a3-4a16-95f7-f58c738e4125-800.png',
      'sizes': [],
    },
    {
      'id': 'item_006',
      'name': 'Third Kit 2023/24',
      'price': 75.00,
      'image': 'https://i1.adis.ws/i/jpl/jd_DX8921-101_a?w=700&resmode=sharp&qlt=70',
      'sizes': ['M', 'L', 'XL'],
    }
  ];

  // --- FIXTURES ---
  static final List<Map<String, dynamic>> fixtures = [
    {
      'homeTeam': 'Man Utd',
      'awayTeam': 'Arsenal',
      'date': '2024-08-24T15:00:00Z',
      'time': '15:00',
      'league': 'Premier League',
      'logoHome': 'https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Manchester_United_FC_crest.svg/1200px-Manchester_United_FC_crest.svg.png',
      'logoAway': 'https://upload.wikimedia.org/wikipedia/en/thumb/5/53/Arsenal_FC.svg/1200px-Arsenal_FC.svg.png',
      'status': 'NS' // Not Started
    },
    {
      'homeTeam': 'Brighton',
      'awayTeam': 'Man Utd',
      'date': '2024-08-31T15:00:00Z',
      'time': '15:00',
      'league': 'Premier League',
      'logoHome': 'https://upload.wikimedia.org/wikipedia/en/thumb/f/fd/Brighton_%26_Hove_Albion_logo.svg/1200px-Brighton_%26_Hove_Albion_logo.svg.png',
      'logoAway': 'https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Manchester_United_FC_crest.svg/1200px-Manchester_United_FC_crest.svg.png',
      'status': 'NS'
    },
    {
      'homeTeam': 'Man Utd',
      'awayTeam': 'Man City',
      'date': '2025-01-18T15:00:00Z',
      'time': '15:00',
      'league': 'FA Cup',
      'logoHome': 'https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Manchester_United_FC_crest.svg/1200px-Manchester_United_FC_crest.svg.png',
      'logoAway': 'https://upload.wikimedia.org/wikipedia/en/thumb/e/eb/Manchester_City_FC_badge.svg/1200px-Manchester_City_FC_badge.svg.png',
      'status': 'NS'
    },
  ];

  // --- STANDINGS ---
  static final List<Map<String, String>> leagues = [
    {'id': 'PL', 'name': 'Premier League'},
    {'id': 'CL', 'name': 'Champions League'},
  ];

  static final List<Map<String, String>> standingsPL = [
    {'rank': '1', 'teamName': 'Man City', 'badge': 'https://upload.wikimedia.org/wikipedia/en/thumb/e/eb/Manchester_City_FC_badge.svg/1200px-Manchester_City_FC_badge.svg.png', 'played': '37', 'win': '27', 'draw': '7', 'loss': '3', 'points': '88'},
    {'rank': '2', 'teamName': 'Arsenal', 'badge': 'https://upload.wikimedia.org/wikipedia/en/thumb/5/53/Arsenal_FC.svg/1200px-Arsenal_FC.svg.png', 'played': '37', 'win': '27', 'draw': '5', 'loss': '5', 'points': '86'},
    {'rank': '3', 'teamName': 'Liverpool', 'badge': 'https://upload.wikimedia.org/wikipedia/en/thumb/0/0c/Liverpool_FC.svg/1200px-Liverpool_FC.svg.png', 'played': '37', 'win': '23', 'draw': '10', 'loss': '4', 'points': '79'},
    {'rank': '8', 'teamName': 'Manchester United', 'badge': 'https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Manchester_United_FC_crest.svg/1200px-Manchester_United_FC_crest.svg.png', 'played': '37', 'win': '17', 'draw': '6', 'loss': '14', 'points': '57'},
  ];
}
