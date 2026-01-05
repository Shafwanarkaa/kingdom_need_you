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
- **Dynamic Sync**: Changes reflect instantly across all user devices.

## 🔐 Installation & Setup

1. **Clone the repository**:

   ```bash
   git clone https://github.com/shafwanarka/kingdom_need_you.git
   ```

2. **Install Dependencies**:

   ```bash
   flutter pub get
   ```

3. **Environment Configuration**:
   Create a `.env` file in the root directory (use `.env.example` as a template):

   ```env
   MOCK_API_URL=your_mockapi_endpoint_here
   NEWS_API_KEY=your_newsapi_key_here
   ```

4. **Run the Application**:
   ```bash
   flutter run
   ```

## 🏗️ Technical Stack

- **Framework**: Flutter (Material 3)
- **State Management**: Provider
- **Backend**: MockAPI (Persistent JSON Storage)
- **Security**: flutter_dotenv
- **APIs**: NewsAPI, TheSportsDB

## 🛡️ Administrative Access

Access the **Admin Dashboard** via the Sidebar Drawer after logging in with administrative credentials. From there, you can manage the app's real-time content.

---

_GGMU - Glory Glory Manchester United!_
