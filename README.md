# 🔴 Manchester United Fan App

A premium, modern fan engagement application for Manchester United supporters, featuring real-time data integration, persistent community features, and a secure administrative dashboard.

![MU Branding](https://upload.wikimedia.org/wikipedia/en/7/7a/Manchester_United_FC_crest.svg)

## 🚀 Recent Updates

- **Dedicated Fans Room API**: Integrated with a specialized `/fansroom` endpoint for community shoutouts.
- **Flexible Data Parsing**: Support for custom MockAPI fields (e.g., `context` as the message body).
- **Secure Auth System**: Role-based access (Admin/User) with a stunning UI.
- **Environment Security**: Sensitive API URLs and keys are now managed via `.env`.

## ✨ Features

### 🏟️ Fan Experience

- **Latest News**: Real-time articles fetched from NewsAPI and local MockAPI.
- **Fans Room**: Post and view community shoutouts with real-time updates.
- **Match Center**: Detailed fixtures and Premier League standings (FotMob style).
- **MU Shop**: Premium carousel and product listings for official merchandise.
- **Squad List**: Visual roster with player details and White-listed local photos for key staff/players.

### 🛠️ Admin Dashboard (PRO Mode)

- **Content Management**: Add, Update, and Delete content.
- **Moderation**: Admin-only ability to delete Fans Room shoutouts.

## 🔐 Installation & Setup

### 0️⃣ Prerequisites

Ensure you have the following installed:

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (v3.0.0+)
- [Dart SDK](https://dart.dev/get-started/sdk)
- An IDE (VS Code or Android Studio)

### 1️⃣ Clone the repository

```bash
git clone https://github.com/Shafwanarkaa/manchester_united_apps.git
cd manchester_united_apps
```

### 2️⃣ Install Dependencies

```bash
flutter pub get
```

### 3️⃣ Environment & API Setup

Create a `.env` file in the root directory. Use the following template:

| Key             | Description                  | Source                                                       |
| --------------- | ---------------------------- | ------------------------------------------------------------ |
| `MOCK_API_URL`  | Endpoint for Fans Room       | [MockAPI](https://mockapi.io) (/fansroom)                    |
| `NEWS_API_KEY`  | Key for latest MU news       | [NewsAPI](https://newsapi.org)                               |
| `RAPID_API_KEY` | Key for fixtures & standings | [RapidAPI](https://rapidapi.com/api-sports/api/api-football) |
| `FD_API_KEY`    | Alternative football data    | [Football-Data.org](https://www.football-data.org)           |

### 4️⃣ MockAPI Schema Configuration

Create a resource named **`fansroom`** in MockAPI with these fields:

- `id`: Object ID
- `user_name`: Faker.js (`person.fullName`)
- `context`: Faker.js (`company.catchPhrase` or `lorem.sentence`)
- `imageUrl`: Faker.js (`image.avatar`)
- `meta`: String
- `createdAt`: Date

### 5️⃣ Run the Application

```bash
flutter run
```

## 🔑 Login Credentials

| Role      | Username | Password |
| --------- | -------- | -------- |
| **Admin** | `admin`  | `mu123`  |
| **User**  | _(any)_  | _(any)_  |

## 🏗️ Technical Stack

- **Framework**: Flutter (Material 3)
- **State Management**: Provider
- **Backend Persistence**: MockAPI (Dedicated `/fansroom` resource)
- **Security**: flutter_dotenv
- **Data Sources**: NewsAPI, API-Football (RapidAPI), Football-Data.org

---

_GGMU - Glory Glory Manchester United!_
