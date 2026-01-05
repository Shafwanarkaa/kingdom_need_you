# 🔴 Manchester United Fan App (Kingdom Need You)

A premium, modern fan engagement application for Manchester United supporters, featuring real-time data integration, persistent community features, and a secure administrative dashboard.

![MU Branding](https://upload.wikimedia.org/wikipedia/en/7/7a/Manchester_United_FC_crest.svg)

## 🚀 Recent Updates

- **MockAPI Persistence**: Full CRUD integration for News, Products, and Fans Room.
- **Fans Room (Shoutouts)**: A real-time guest book for community engagement.
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

- **Content Management**: Add, Update, and Delete News or Shop products.
- **Moderation**: Admin-only ability to delete Fans Room shoutouts.

## 🔐 Installation & Setup

### 0️⃣ Prerequisites

Before starting, ensure you have the following installed:

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (v3.0.0 or higher)
- [Dart SDK](https://dart.dev/get-started/sdk)
- An IDE (VS Code or Android Studio) with Flutter/Dart extensions.

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

Create a `.env` file in the root directory. You will need keys from the following services:

| Key             | Description                  | Source                                                       |
| --------------- | ---------------------------- | ------------------------------------------------------------ |
| `MOCK_API_URL`  | Endpoint for CRUD data       | [MockAPI](https://mockapi.io)                                |
| `NEWS_API_KEY`  | Key for latest MU news       | [NewsAPI](https://newsapi.org)                               |
| `RAPID_API_KEY` | Key for fixtures & standings | [RapidAPI](https://rapidapi.com/api-sports/api/api-football) |
| `FD_API_KEY`    | Alternative football data    | [Football-Data.org](https://www.football-data.org)           |

### 4️⃣ MockAPI Schema Configuration

To use the CRUD features, create a resource named `contents` in MockAPI with the following fields:

- `type`: String (values: `shoutout`, `news`, or `product`)
- `user_name`: String
- `content`: Text
- `imageUrl`: String
- `meta`: String
- `price`: Number
- `createdAt`: DateTime

### 5️⃣ Run the Application

```bash
flutter run
```

## 🔑 Login Credentials

For demonstration purposes, you can use the following credentials:

| Role      | Username | Password | Access Level           |
| --------- | -------- | -------- | ---------------------- |
| **Admin** | `admin`  | `mu123`  | Full CRUD & Moderation |
| **User**  | _(any)_  | _(any)_  | Read-only + Shoutouts  |

> [!NOTE]
> Entering any username other than `admin` will log you in with a standard User role.

## 🏗️ Technical Stack

- **Framework**: Flutter (Material 3)
- **State Management**: Provider
- **Backend Persistence**: MockAPI
- **Security**: flutter_dotenv (API Key Protection)
- **Data Sources**: NewsAPI, API-Football (RapidAPI), Football-Data.org

---

_GGMU - Glory Glory Manchester United!_
