# 🏗️ Zelus Pro - Architecture Documentation

## System Overview

Zelus Pro uses a **monorepo package-based architecture** where shared code is extracted into reusable packages, enabling both the consumer app (Zelus) and business app (Zelus Pro) to share models, services, and UI components.

---

## High-Level Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                     ZELUS ECOSYSTEM                          │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│  ┌──────────────────┐              ┌──────────────────┐    │
│  │  Zelus Consumer  │              │   Zelus Pro      │    │
│  │  (Customer App)  │              │  (Business App)  │    │
│  │                  │              │                  │    │
│  │  • Browse        │              │  • Dashboard     │    │
│  │  • Book          │              │  • Bookings      │    │
│  │  • Review        │              │  • Clients       │    │
│  │  • Message       │              │  • Earnings      │    │
│  │                  │              │  • Analytics     │    │
│  └────────┬─────────┘              └────────┬─────────┘    │
│           │                                 │               │
│           └──────────┬──────────────────────┘               │
│                      │                                       │
│           ┌──────────▼──────────────────────┐              │
│           │    Shared Packages               │              │
│           ├──────────────────────────────────┤              │
│           │  • zelus_api (Models, Services) │              │
│           │  • zelus_core (Utils, Constants)│              │
│           │  • zelus_ui (Theme, Widgets)    │              │
│           └──────────┬──────────────────────┘              │
│                      │                                       │
└──────────────────────┼───────────────────────────────────────┘
                       │
            ┌──────────▼──────────────────────┐
            │     FastAPI Backend              │
            │     (Python 3.10)                │
            ├──────────────────────────────────┤
            │  Routers:                        │
            │  • /auth      - Authentication   │
            │  • /salons    - Salon endpoints  │
            │  • /pros      - Stylist endpoints│
            │  • /pro       - Dashboard (NEW)  │
            │  • /feed      - Social feed      │
            │  • /ai        - AI features      │
            └──────────┬──────────────────────┘
                       │
            ┌──────────▼──────────────────────┐
            │   Neon PostgreSQL                │
            │   (Serverless)                   │
            ├──────────────────────────────────┤
            │  Tables:                         │
            │  • users                         │
            │  • salons                        │
            │  • stylists                      │
            │  • bookings                      │
            │  • services                      │
            │  • reviews                       │
            └──────────────────────────────────┘
```

---

## Package Architecture

### 1. zelus_api (Data Layer)

**Purpose:** Shared data models, API services, and HTTP client

```
zelus_api/
├── lib/
│   ├── src/
│   │   ├── models/
│   │   │   ├── user.dart              # User with roles
│   │   │   ├── salon.dart             # Salon locations
│   │   │   ├── stylist.dart           # Professional profiles
│   │   │   ├── booking.dart           # Appointments
│   │   │   ├── service.dart           # Services offered
│   │   │   ├── review.dart            # Customer reviews
│   │   │   ├── activity_post.dart     # Social posts
│   │   │   └── collection.dart        # Saved content
│   │   │
│   │   ├── services/
│   │   │   ├── auth_service.dart      # Authentication
│   │   │   ├── salon_service.dart     # Salon operations
│   │   │   ├── stylist_service.dart   # Stylist operations
│   │   │   ├── booking_service.dart   # Booking management
│   │   │   └── review_service.dart    # Reviews
│   │   │
│   │   └── clients/
│   │       ├── api_client.dart        # Dio HTTP client
│   │       └── api_config.dart        # API configuration
│   │
│   └── zelus_api.dart                 # Public exports
│
└── pubspec.yaml                       # Dependencies: dio, freezed, etc.
```

**Key Features:**
- Freezed models with JSON serialization
- Service layer abstraction
- Centralized HTTP client
- Shared by both apps

---

### 2. zelus_core (Utilities Layer)

**Purpose:** Shared utilities, constants, and extensions

```
zelus_core/
├── lib/
│   ├── src/
│   │   ├── constants/
│   │   │   ├── app_constants.dart     # API URLs, keys, limits
│   │   │   └── feature_flags.dart     # Feature toggles
│   │   │
│   │   ├── utils/
│   │   │   ├── date_formatter.dart    # Date/time formatting
│   │   │   ├── validators.dart        # Input validation
│   │   │   └── storage_helper.dart    # SharedPreferences wrapper
│   │   │
│   │   └── extensions/
│   │       ├── string_extensions.dart # String helpers
│   │       └── datetime_extensions.dart # DateTime helpers
│   │
│   └── zelus_core.dart                # Public exports
│
└── pubspec.yaml                       # Dependencies: intl, shared_prefs
```

**Key Features:**
- No Flutter dependencies (pure Dart where possible)
- Reusable utility functions
- Feature flag system
- Extension methods

---

### 3. zelus_ui (Presentation Layer)

**Purpose:** Shared design system and reusable widgets

```
zelus_ui/
├── lib/
│   ├── src/
│   │   ├── theme/
│   │   │   ├── app_theme.dart         # Material theme
│   │   │   ├── colors.dart            # Color palette
│   │   │   └── typography.dart        # Text styles
│   │   │
│   │   └── widgets/
│   │       ├── custom_button.dart     # Styled buttons
│   │       ├── loading_indicator.dart # Loading states
│   │       ├── empty_state.dart       # Empty views
│   │       └── error_widget.dart      # Error displays
│   │
│   └── zelus_ui.dart                  # Public exports
│
└── pubspec.yaml                       # Dependencies: google_fonts, etc.
```

**Key Features:**
- Consistent Material Design 3 theme
- Charcoal & gold color scheme
- Reusable UI components
- Inter font typography

---

## Mobile Pro Architecture

### App Structure

```
mobile_pro/
├── lib/
│   ├── core/
│   │   └── router/
│   │       └── app_router.dart        # GoRouter configuration
│   │
│   ├── providers/
│   │   └── auth_provider.dart         # Authentication state
│   │
│   ├── features/                      # Feature modules
│   │   ├── auth/
│   │   │   └── screens/
│   │   │       └── login_screen.dart
│   │   │
│   │   ├── dashboard/
│   │   │   ├── screens/
│   │   │   │   ├── stylist_dashboard_screen.dart
│   │   │   │   └── salon_dashboard_screen.dart
│   │   │   └── widgets/
│   │   │       ├── stat_card.dart
│   │   │       ├── quick_action_button.dart
│   │   │       └── upcoming_booking_card.dart
│   │   │
│   │   ├── calendar/
│   │   │   ├── screens/
│   │   │   │   └── calendar_screen.dart
│   │   │   └── widgets/
│   │   │       └── booking_list_item.dart
│   │   │
│   │   ├── clients/
│   │   │   └── screens/
│   │   │       └── clients_screen.dart
│   │   │
│   │   ├── profile/
│   │   │   └── screens/
│   │   │       └── profile_screen.dart
│   │   │
│   │   ├── earnings/
│   │   │   └── screens/
│   │   │       └── earnings_screen.dart
│   │   │
│   │   ├── staff/
│   │   │   └── screens/
│   │   │       └── staff_screen.dart
│   │   │
│   │   └── analytics/
│   │       └── screens/
│   │           └── analytics_screen.dart
│   │
│   └── main.dart                      # App entry point
│
└── pubspec.yaml
```

---

## State Management

### Riverpod Providers

```dart
// API Client Provider
final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});

// Auth Service Provider
final authServiceProvider = Provider<AuthService>((ref) {
  final client = ref.watch(apiClientProvider);
  return AuthService(client);
});

// Auth State Provider
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authService = ref.watch(authServiceProvider);
  return AuthNotifier(authService);
});
```

**Flow:**
1. Providers created in `providers/` folder
2. Services from `zelus_api` injected
3. State notifiers manage UI state
4. Screens watch providers for updates

---

## Navigation Flow

### Role-Based Routing

```
Login Screen
     │
     ├─── [Stylist Role] ──▶ Stylist Dashboard ──▶ Bottom Nav
     │                           ├─ Home
     │                           ├─ Calendar
     │                           ├─ Clients
     │                           ├─ Profile
     │                           └─ More (Earnings, Help, Logout)
     │
     └─── [Owner Role] ────▶ Salon Dashboard ───▶ Bottom Nav
                                 ├─ Dashboard
                                 ├─ Bookings
                                 ├─ Staff
                                 └─ Analytics
```

**Implementation:**
```dart
if (user?.role == UserRole.salonOwner) {
  context.go('/dashboard/salon');
} else {
  context.go('/dashboard/stylist');
}
```

---

## Backend Architecture

### API Router Organization

```
FastAPI Backend
├── routers/
│   ├── auth.py              # POST /auth/login, /register
│   ├── salons.py            # GET/PUT /salons
│   ├── pros.py              # GET /pros (alias for stylists)
│   ├── stylists.py          # GET /stylists
│   ├── pro_dashboard.py     # NEW: Pro app endpoints
│   ├── feed.py              # Social feed
│   └── ai.py                # AI features
│
├── models/
│   └── models.py            # SQLAlchemy models
│
├── schemas/
│   └── schemas.py           # Pydantic schemas
│
└── main.py                  # FastAPI app
```

### Pro Dashboard Endpoints

```python
/pro/
├── /dashboard/stats         # Dashboard overview
├── /bookings                # List bookings
├── /bookings/{id}/status    # Update booking
├── /availability            # Set/get availability
├── /clients                 # List clients
├── /clients/{id}            # Client details
├── /clients/{id}/notes      # Update notes
├── /earnings                # Revenue data
├── /profile                 # Update profile
├── /portfolio               # Upload/delete images
└── /salon/{id}/
    ├── /staff               # Staff management
    └── /analytics           # Business analytics
```

---

## Data Flow

### Example: Booking Management

```
┌──────────────┐
│  UI Screen   │  CalendarScreen shows bookings list
└──────┬───────┘
       │ 1. Fetch bookings
       ▼
┌──────────────┐
│  Provider    │  bookingProvider.getBookings()
└──────┬───────┘
       │ 2. Call service
       ▼
┌──────────────┐
│  Service     │  BookingService.getMyBookings()
│ (zelus_api)  │
└──────┬───────┘
       │ 3. HTTP request
       ▼
┌──────────────┐
│  API Client  │  client.get('/pro/bookings')
│ (zelus_api)  │
└──────┬───────┘
       │ 4. Network call
       ▼
┌──────────────┐
│  Backend API │  pro_dashboard.get_my_bookings()
└──────┬───────┘
       │ 5. Query DB
       ▼
┌──────────────┐
│  PostgreSQL  │  SELECT * FROM bookings
└──────┬───────┘
       │ 6. Return data
       ▼
┌──────────────┐
│  Response    │  JSON array of bookings
└──────┬───────┘
       │ 7. Deserialize
       ▼
┌──────────────┐
│  Model       │  List<Booking> objects
│ (zelus_api)  │
└──────┬───────┘
       │ 8. Update state
       ▼
┌──────────────┐
│  UI Updates  │  ListView.builder renders bookings
└──────────────┘
```

---

## Security Architecture

### Authentication Flow

```
1. User enters credentials
2. Mobile app calls POST /auth/login
3. Backend validates against DB
4. Returns JWT token + user object
5. Token stored in SharedPreferences
6. Subsequent requests include token in header
7. Backend validates token on protected routes
```

### Role-Based Access

```dart
enum UserRole {
  customer,      # Can book services
  stylist,       # Can manage bookings
  salonOwner,    # Can manage salon + staff
}
```

**Enforcement:**
- Mobile: UI conditionally renders based on role
- Backend: Middleware checks user role for protected routes

---

## Deployment Architecture

```
┌─────────────────────┐
│  Flutter Web/APK    │
│  (Client Device)    │
└──────────┬──────────┘
           │ HTTPS
           ▼
┌─────────────────────┐
│  AWS EC2 Instance   │
│  Ubuntu Server      │
│  3.24.31.8:8006     │
├─────────────────────┤
│  • Uvicorn          │
│  • FastAPI App      │
│  • Python 3.10      │
└──────────┬──────────┘
           │ PostgreSQL Protocol
           ▼
┌─────────────────────┐
│  Neon PostgreSQL    │
│  (Serverless)       │
│  AWS Singapore      │
└─────────────────────┘
```

---

## Development Workflow

```
Developer
    │
    ├─ 1. Modify models/services?
    │    └─▶ Edit packages/zelus_api
    │         └─▶ Run: flutter pub run build_runner build
    │
    ├─ 2. Add utilities?
    │    └─▶ Edit packages/zelus_core
    │
    ├─ 3. UI components?
    │    └─▶ Edit packages/zelus_ui
    │
    ├─ 4. Pro app features?
    │    └─▶ Edit mobile_pro/lib/features/
    │         └─▶ Run: flutter run
    │
    └─ 5. Backend endpoints?
         └─▶ Edit backend/app/routers/pro_dashboard.py
              └─▶ Restart: uvicorn
```

---

## Performance Considerations

### Mobile App
- **State Management:** Riverpod for efficient rebuilds
- **Navigation:** GoRouter for declarative routing
- **Images:** cached_network_image for caching
- **Lists:** ListView.builder for lazy loading
- **Charts:** fl_chart for performant visualizations

### Backend
- **Connection Pooling:** SQLAlchemy manages connections
- **Async Endpoints:** FastAPI async/await
- **Response Caching:** Can add Redis layer
- **Database Indexing:** On user_id, date fields

---

## Testing Strategy

### Unit Tests
- Test services in `zelus_api`
- Test utilities in `zelus_core`
- Test models serialization

### Widget Tests
- Test individual screens
- Test custom widgets
- Test user interactions

### Integration Tests
- Test full booking flow
- Test authentication flow
- Test navigation flow

---

## Future Architecture Enhancements

### Phase 2
- [ ] Add WebSocket for real-time updates
- [ ] Implement offline-first architecture with Hive
- [ ] Add Redis caching layer
- [ ] Implement CDN for media files

### Phase 3
- [ ] Microservices architecture
- [ ] Separate auth service
- [ ] Add message queue (RabbitMQ/Kafka)
- [ ] GraphQL API option

---

## Key Design Decisions

| Decision | Rationale |
|----------|-----------|
| **Monorepo** | Easier code sharing between apps |
| **Package-based** | Clear separation of concerns |
| **Riverpod** | Modern, flexible state management |
| **GoRouter** | Type-safe, declarative routing |
| **Freezed** | Immutable models, less boilerplate |
| **FastAPI** | Fast, modern, auto-docs |
| **Neon** | Serverless, scalable, AWS-hosted |

---

**Architecture Status: ✅ Production-Ready**

This architecture supports:
- ✅ Multiple client apps
- ✅ Shared business logic
- ✅ Scalable backend
- ✅ Role-based access
- ✅ Modern development practices

---

*Last Updated: October 2025*

