# 🚀 Zelus Pro - Business App for Beauty Professionals

**Professional dashboard for stylists and salon owners to manage their beauty business**

---

## 📊 Project Overview

Zelus Pro is the business companion to the Zelus consumer app. It provides stylists and salon owners with powerful tools to manage bookings, clients, earnings, and analytics - all in one beautiful mobile app.

**Version:** 1.0.0  
**Status:** ✅ MVP Ready  
**Backend:** Shared with Zelus Consumer App  
**Server:** AWS EC2 (3.24.31.8:8006)  

---

## 🏗️ Architecture

```
┌──────────────────────┐         ┌──────────────────────┐
│  Zelus Consumer      │         │  Zelus Pro           │
│  (Customer App)      │         │  (Business App)      │
│  • Browse salons     │         │  • Manage bookings   │
│  • Book services     │         │  • Client management │
│  • Reviews           │         │  • Earnings tracking │
└──────────┬───────────┘         └──────────┬───────────┘
           │                                │
           │         ┌──────────────────────┴─────┐
           └─────────▶  Shared Packages          │
                     │  • zelus_api (models)     │
                     │  • zelus_core (utils)     │
                     │  • zelus_ui (design)      │
                     └──────────┬─────────────────┘
                                │
                     ┌──────────▼─────────────────┐
                     │  FastAPI Backend           │
                     │  Port: 8006                │
                     │  • Auth                    │
                     │  • Bookings                │
                     │  • Pro Dashboard           │
                     └──────────┬─────────────────┘
                                │
                     ┌──────────▼─────────────────┐
                     │  PostgreSQL (Neon)         │
                     │  Serverless Database       │
                     └────────────────────────────┘
```

---

## 📂 Project Structure

```
Zelus_Pro/
├── packages/                    # Shared code packages
│   ├── zelus_api/              # API client & data models
│   │   ├── lib/
│   │   │   ├── src/
│   │   │   │   ├── models/     # User, Salon, Stylist, Booking, etc.
│   │   │   │   ├── services/   # API services
│   │   │   │   └── clients/    # HTTP client
│   │   │   └── zelus_api.dart
│   │   └── pubspec.yaml
│   │
│   ├── zelus_core/             # Core utilities
│   │   ├── lib/
│   │   │   ├── src/
│   │   │   │   ├── constants/  # App constants, feature flags
│   │   │   │   ├── utils/      # Date formatter, validators, storage
│   │   │   │   └── extensions/ # String, DateTime extensions
│   │   │   └── zelus_core.dart
│   │   └── pubspec.yaml
│   │
│   └── zelus_ui/               # Shared UI components
│       ├── lib/
│       │   ├── src/
│       │   │   ├── theme/      # Colors, typography, app theme
│       │   │   └── widgets/    # Reusable widgets
│       │   └── zelus_ui.dart
│       └── pubspec.yaml
│
└── mobile_pro/                 # Zelus Pro Flutter app
    ├── lib/
    │   ├── core/
    │   │   └── router/         # App navigation (GoRouter)
    │   ├── providers/          # State management (Riverpod)
    │   │   └── auth_provider.dart
    │   ├── features/           # Feature modules
    │   │   ├── auth/           # Login screen
    │   │   ├── dashboard/      # Dashboard screens (stylist & salon)
    │   │   ├── calendar/       # Calendar & booking management
    │   │   ├── clients/        # Client management
    │   │   ├── profile/        # Profile management
    │   │   ├── earnings/       # Earnings & payouts
    │   │   ├── staff/          # Staff management (salon owners)
    │   │   └── analytics/      # Business analytics (salon owners)
    │   └── main.dart
    ├── assets/
    └── pubspec.yaml
```

---

## 🎯 Features

### ✅ For Stylists

- **📊 Dashboard Home**
  - Today's bookings & earnings overview
  - New messages & rating stats
  - Quick actions (upload work, set availability, view clients)
  - Upcoming bookings list
  - Recent activity feed

- **📅 Calendar & Bookings**
  - Week/month calendar view with booking indicators
  - Accept/reject booking requests
  - View booking details
  - Set availability & time slots
  - Mark bookings as completed/cancelled
  - Booking history

- **👥 Client Management**
  - Client list with search
  - Client profiles (visit history, preferences, notes)
  - Add private notes
  - Total visits & spending tracking
  - Quick book/message actions

- **📸 Portfolio & Services**
  - Upload/delete work photos
  - Manage services (name, price, duration)
  - Update bio & specialties
  - Profile preview (customer view)

- **💰 Earnings & Payouts**
  - Today/week/month/year revenue
  - Interactive earnings chart
  - Recent transactions list
  - Booking statistics
  - Average per booking

- **💬 Messages**
  - Chat with customers (coming soon)
  - Quick replies
  - Booking inquiries

---

### ✅ For Salon Owners

**All stylist features PLUS:**

- **🏢 Salon Dashboard**
  - Total revenue & bookings
  - Active staff count
  - Salon rating overview
  - Quick actions (manage staff, view analytics)

- **👨‍💼 Staff Management**
  - View all staff members
  - Staff performance (bookings, ratings)
  - Add/remove staff
  - Set permissions & access
  - Staff calendar view

- **📈 Business Analytics**
  - Monthly revenue charts
  - Top services breakdown
  - Staff performance comparison
  - Customer retention metrics
  - Detailed reporting

- **⚙️ Salon Settings**
  - Update salon profile
  - Manage operating hours
  - Edit services & pricing
  - Amenities management

---

## 🛠️ Tech Stack

### Mobile App
- **Framework:** Flutter 3.x
- **Language:** Dart 3.x
- **State Management:** Riverpod
- **Navigation:** GoRouter
- **Calendar:** table_calendar, syncfusion_flutter_calendar
- **Charts:** fl_chart
- **HTTP:** Dio (via zelus_api package)
- **Serialization:** freezed, json_serializable
- **UI:** Material Design 3, custom Zelus theme

### Shared Packages
- **zelus_api:** Dio, Retrofit, Freezed, json_serializable
- **zelus_core:** SharedPreferences, Hive, Intl
- **zelus_ui:** Google Fonts, cached_network_image, shimmer

### Backend (Shared)
- **Framework:** FastAPI (Python 3.10)
- **Database:** Neon PostgreSQL 17.5 (Serverless)
- **ORM:** SQLAlchemy 2.0
- **Validation:** Pydantic

---

## 🚀 Getting Started

### Prerequisites
- Flutter 3.0+
- Dart 3.0+
- Access to AWS backend (3.24.31.8:8006)

### Installation

1. **Clone the repository:**
```bash
git clone https://github.com/yourusername/Zelus_Pro.git
cd Zelus_Pro
```

2. **Install package dependencies:**
```bash
# Install zelus_api
cd packages/zelus_api
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs

# Install zelus_core
cd ../zelus_core
flutter pub get

# Install zelus_ui
cd ../zelus_ui
flutter pub get

# Go back to root
cd ../..
```

3. **Install mobile_pro dependencies:**
```bash
cd mobile_pro
flutter pub get
```

4. **Run the app:**
```bash
flutter run
```

### Login Credentials (Demo)

**Stylist Account:**
- Email: `demo@zelus.com`
- Password: `password123`

**Salon Owner Account:**
- Email: `owner@zelus.com`
- Password: `password123`

---

## 📡 API Endpoints

**Base URL:** `http://3.24.31.8:8006/api/v1`

### Pro Dashboard Endpoints

#### Dashboard
- `GET /pro/dashboard/stats` - Get overview statistics

#### Bookings
- `GET /pro/bookings` - List all bookings (with filters)
- `PUT /pro/bookings/{id}/status` - Update booking status

#### Availability
- `POST /pro/availability` - Set available time slots
- `GET /pro/availability` - Get availability for date range

#### Clients
- `GET /pro/clients` - List all clients
- `GET /pro/clients/{id}` - Get client details
- `PUT /pro/clients/{id}/notes` - Update client notes

#### Earnings
- `GET /pro/earnings` - Get earnings data (with period filter)

#### Profile
- `PUT /pro/profile` - Update profile
- `POST /pro/portfolio` - Upload portfolio image
- `DELETE /pro/portfolio` - Delete portfolio image

#### Salon Owner Only
- `GET /pro/salon/{id}/staff` - Get staff list
- `GET /pro/salon/{id}/analytics` - Get salon analytics
- `POST /pro/salon/{id}/staff` - Add staff member
- `DELETE /pro/salon/{id}/staff/{staffId}` - Remove staff

**Full API docs:** http://3.24.31.8:8006/docs

---

## 🎨 Design System

### Colors
- **Primary:** Charcoal (#1F2937)
- **Accent:** Muted Gold (#B8956A)
- **Surface:** Light Gray (#F9FAFB)
- **Success:** Green (#10B981)
- **Error:** Red (#EF4444)
- **Warning:** Orange (#F59E0B)
- **Info:** Blue (#3B82F6)

### Typography
- **Font:** Inter (Google Fonts)
- **Weights:** 200-500 (light to medium)
- **Style:** Minimal, elegant, professional

---

## 🔐 Authentication Flow

1. User opens Zelus Pro app
2. Enters email/phone and password
3. Backend validates credentials
4. Returns user object with `role` (stylist or salon_owner)
5. App navigates to appropriate dashboard based on role
6. JWT token stored for authenticated requests

---

## 📱 Navigation Structure

### Stylist Bottom Nav (5 tabs)
1. **Home** - Dashboard with overview
2. **Calendar** - Bookings & availability
3. **Clients** - Client management
4. **Profile** - Profile & settings
5. **More** - Earnings, help, logout

### Salon Owner Bottom Nav (4 tabs)
1. **Dashboard** - Business overview
2. **Bookings** - Calendar view
3. **Staff** - Team management
4. **Analytics** - Business insights

---

## 🧪 Testing

### Manual Testing Checklist
- [ ] Login as stylist
- [ ] Login as salon owner
- [ ] View dashboard stats
- [ ] Browse calendar & bookings
- [ ] Accept/reject bookings
- [ ] View client list
- [ ] View earnings data
- [ ] Navigate between all screens
- [ ] Test pull-to-refresh
- [ ] Test search functionality
- [ ] View salon analytics (owner)
- [ ] View staff list (owner)

### Running Tests
```bash
cd mobile_pro
flutter test
```

---

## 📈 Roadmap

### Phase 1 (✅ Current - MVP)
- [x] Authentication
- [x] Dashboard screens
- [x] Calendar & booking management
- [x] Client management
- [x] Earnings tracking
- [x] Salon owner features
- [x] Backend Pro API endpoints

### Phase 2 (Q1 2026)
- [ ] Real-time messaging
- [ ] Push notifications
- [ ] Payment processing (Stripe)
- [ ] Advanced analytics
- [ ] Team collaboration tools
- [ ] Appointment reminders

### Phase 3 (Q2 2026)
- [ ] AI-powered insights
- [ ] Video consultations
- [ ] Inventory management
- [ ] Marketing tools
- [ ] Loyalty programs
- [ ] Multi-location support

---

## 🤝 Development Workflow

### Adding New Features

1. **Shared Code?** → Add to appropriate package (zelus_api, zelus_core, or zelus_ui)
2. **Pro-specific?** → Add to mobile_pro/lib/features/
3. **Need API?** → Add endpoint to backend/app/routers/pro_dashboard.py
4. **Update docs** → Keep README up to date

### Code Style
- Follow Flutter style guide
- Use Riverpod for state management
- Use freezed for data models
- Keep widgets small and focused
- Comment complex logic

---

## 🐛 Known Issues

1. **Mock Data:** Most endpoints return mock data (need DB integration)
2. **Authentication:** Using simplified auth (need full JWT implementation)
3. **Image Upload:** File upload not yet implemented
4. **Real-time Updates:** No WebSocket support yet
5. **Offline Mode:** No offline caching yet

---

## 📚 Documentation

- **[Shared Packages Guide](docs/PACKAGES.md)** - How to use shared packages
- **[API Documentation](http://3.24.31.8:8006/docs)** - Interactive API docs
- **[Design System](docs/DESIGN_SYSTEM.md)** - UI/UX guidelines
- **[State Management](docs/STATE_MANAGEMENT.md)** - Riverpod patterns

---

## 👥 Team & Support

**Issues:** GitHub Issues  
**Documentation:** /docs folder  
**API Docs:** http://3.24.31.8:8006/docs  

---

## 📄 License

MIT License - see LICENSE file

---

## 🎉 Acknowledgments

- Flutter team for the amazing framework
- Riverpod for elegant state management
- FastAPI for the powerful backend
- Neon for serverless PostgreSQL

---

**Built with ❤️ for beauty professionals**

