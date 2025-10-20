# 🎨 Visual Design Guide - Zelus Pro

## Color Showcase

### Primary Colors
```
┌─────────────────────────────────────────┐
│  Primary Gradient                       │
│  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓     │
│  #6366F1 (Indigo) → #8B5CF6 (Purple)   │
│                                         │
│  Use for: Buttons, CTAs, Navigation     │
└─────────────────────────────────────────┘

┌─────────────────────────────────────────┐
│  Accent Gradient                        │
│  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓     │
│  #06B6D4 (Cyan) → #3B82F6 (Blue)       │
│                                         │
│  Use for: Quick Actions, Highlights     │
└─────────────────────────────────────────┘
```

### Status Colors
```
✅ Success: #10B981 (Green)
   Use: Completed bookings, positive trends, earnings

❌ Error: #EF4444 (Red)
   Use: Cancelled, errors, warnings

⚠️ Warning: #F59E0B (Amber)
   Use: Pending bookings, ratings

ℹ️ Info: #3B82F6 (Blue)
   Use: Messages, notifications
```

### Backgrounds
```
Background:     #FAFAFC (Very light purple tint)
Surface:        #FFFFFF (Pure white)
Surface Light:  #FAFAFC (Subtle tint)
Surface Glass:  #F2FFFFFF (95% opacity - for blur)
```

---

## Typography Scale

### Display (Hero Text)
```
Display Large:  40px / Weight 700 / -1.0 spacing
Display Medium: 32px / Weight 700 / -0.5 spacing
Display Small:  28px / Weight 600 / -0.5 spacing

Usage: "Welcome Back" on login, hero headings
```

### Headlines (Section Headers)
```
Headline Large:  24px / Weight 600 / -0.3 spacing
Headline Medium: 22px / Weight 600 / -0.3 spacing
Headline Small:  20px / Weight 600 / -0.2 spacing

Usage: Dashboard name, screen titles
```

### Titles (Card Headers)
```
Title Large:  18px / Weight 600 / 0 spacing
Title Medium: 16px / Weight 600 / 0 spacing
Title Small:  14px / Weight 600 / 0 spacing

Usage: "Quick Actions", "Upcoming Bookings"
```

### Body (Content Text)
```
Body Large:  16px / Weight 400 / 0 spacing
Body Medium: 14px / Weight 400 / 0 spacing
Body Small:  13px / Weight 400 / 0 spacing

Usage: Card content, descriptions, secondary text
```

---

## Component Gallery

### 🎴 Stat Card (Glassmorphism)
```
┌─────────────────────────────────────┐
│  ┌──────┐                     +12%  │
│  │  📊  │                     ↗     │
│  └──────┘                           │
│                                     │
│  4                                  │
│  Bookings                           │
└─────────────────────────────────────┘

Features:
✓ Gradient background (white → light purple)
✓ Frosted glass blur effect
✓ Gradient icon container
✓ Trend badge with icon
✓ 24px border radius
✓ Soft shadow
```

### 🔘 Primary Button
```
┌──────────────────────────┐
│    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓     │
│        Sign In           │
│    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓     │
└──────────────────────────┘
       ↓ Glowing shadow

Features:
✓ Primary gradient (indigo → purple)
✓ 16px border radius
✓ Weight 600 text
✓ Colored glow shadow
✓ 56px height
```

### 🎯 Quick Action Button
```
┌──────────┐
│  ▓▓▓▓▓▓  │
│    📅    │
│          │
│ Schedule │
│  ▓▓▓▓▓▓  │
└──────────┘

Features:
✓ Full gradient background
✓ White icon & text
✓ 20px border radius
✓ Gradient shadow
✓ Square aspect ratio
```

### 👤 Booking Card
```
┌────────────────────────────────────────┐
│  ┌──┐  Sarah Wilson         🕐 10:00 AM│
│  │ S │  Haircut & Style               │
│  └──┘                                  │
└────────────────────────────────────────┘

Features:
✓ Colored avatar bubble
✓ Name + service hierarchy
✓ Time badge with icon
✓ 20px border radius
✓ Subtle shadow
```

### 🔍 Search Bar
```
┌────────────────────────────────────────┐
│  🔍  Search clients...                 │
└────────────────────────────────────────┘

Features:
✓ 16px border radius
✓ Visible border (0.5 opacity)
✓ White background
✓ 20px horizontal padding
```

### 💬 Activity Item
```
┌────────────────────────────────────────┐
│  ┌──┐                                  │
│  │⭐│  New review             2h ago   │
│  └──┘  5 stars from David Park        │
└────────────────────────────────────────┘

Features:
✓ Colored icon container (12px radius)
✓ Title + subtitle hierarchy
✓ Time stamp (tertiary color)
```

---

## Layout Patterns

### Screen Layout
```
┌─────────────────────────────────────────┐
│  AppBar (80-90px height)                │
│  ┌─ Welcome back,                       │
│  └─ John Smith                          │
│                    [🔔] [⚙️]           │
├─────────────────────────────────────────┤
│  Content Area (20px padding)            │
│                                         │
│  [Stat Cards] - 16px gap               │
│                                         │
│  32px vertical spacing                 │
│                                         │
│  Section Header (Title Large, 700)     │
│  16px spacing                          │
│  [Cards/Items] - 12px gaps             │
│                                         │
├─────────────────────────────────────────┤
│  Bottom Navigation (with border)        │
│  [Home] [Calendar] [Clients] [More]    │
└─────────────────────────────────────────┘
```

### Card Spacing
```
Padding inside cards:       16-20px
Gap between cards:          12-16px
Section vertical spacing:   32px
Title to content:           16px
```

---

## Iconography

### Icon Sizes
```
Small:      16px (badges, inline icons)
Medium:     22-24px (buttons, navigation)
Large:      28-32px (quick actions)
XL:         40-48px (stat cards, hero)
```

### Icon Styles
```
Default:    Outlined (e.g., Icons.home_outlined)
Active:     Filled (e.g., Icons.home)
Status:     Rounded (e.g., Icons.star_rounded)
```

---

## Shadow System

### Subtle Shadow (Cards)
```dart
BoxShadow(
  color: ZelusColors.shadow,        // 0x08000000
  blurRadius: 8-20,
  offset: Offset(0, 2-4),
)
```

### Glow Shadow (Buttons)
```dart
BoxShadow(
  color: ZelusColors.primary.withOpacity(0.3),
  blurRadius: 12-16,
  offset: Offset(0, 4),
)
```

---

## Border Radius Guide

```
Chips/Badges:       8-10px   ━━━━━━━━━━━━━
Input Fields:       16px     ━━━━━━━━━━━━━━━━
Buttons:            16px     ━━━━━━━━━━━━━━━━
Cards:              20px     ━━━━━━━━━━━━━━━━━━━
Stat Cards:         24px     ━━━━━━━━━━━━━━━━━━━━━━
Avatars:            14-16px  ━━━━━━━━━━━━━━━━━
```

---

## Gradient Combinations

### Recommended Gradients
```
1. Primary Action:
   #6366F1 → #8B5CF6 (Indigo → Purple)

2. Accent Action:
   #06B6D4 → #3B82F6 (Cyan → Blue)

3. Success/Money:
   #10B981 → #34D399 (Green → Light Green)

4. Fun/Creative:
   #8B5CF6 → #EC4899 (Purple → Pink)

5. Info/Cool:
   #3B82F6 → #8B5CF6 (Blue → Purple)
```

---

## Spacing System

### Vertical Rhythm
```
Between list items:         12px
Between form fields:        16-20px
Between sections:           32px
Before/after headers:       16px
Card internal padding:      20px
Screen edge padding:        20px
```

### Horizontal Spacing
```
Between columns (2-col):    12-16px
Between columns (3-col):    12px
Icon to text:               8-12px
Label to value:             8px
```

---

## Animation Guidelines

### Duration
```
Micro (Hover):      100-150ms
Small (Ripple):     200-300ms
Medium (Slide):     300-400ms
Large (Page):       400-500ms
```

### Curves
```
Standard:           Curves.easeInOut
Sharp:              Curves.easeOut
Smooth:             Curves.easeInOutCubic
Bounce:             Curves.elasticOut
```

---

## Accessibility

### Color Contrast
```
Text on White:      #0F172A (21:1 ratio)
Secondary Text:     #64748B (7.5:1 ratio)
Tertiary Text:      #94A3B8 (4.8:1 ratio)

Minimum for body:   4.5:1 (AA)
Minimum for large:  3:1 (AA)
```

### Touch Targets
```
Minimum size:       44x44 px
Recommended:        48x48 px
Icon buttons:       40-48 px
FAB:                56x56 px
```

### Focus States
```
Border width:       2px
Border color:       Primary (#6366F1)
Border radius:      Same as element
Offset:             2px
```

---

## Best Practices

### ✅ Do
- Use gradients for primary CTAs
- Apply glassmorphism to stat cards
- Use bold weights (600-700) for headers
- Add trend indicators to metrics
- Include status badges where relevant
- Use colored avatar containers
- Apply generous spacing (20-32px)
- Use consistent border radius (16-24px)

### ❌ Don't
- Mix flat colors with gradients randomly
- Use light font weights for headers
- Overcrowd layouts (maintain whitespace)
- Use tiny touch targets (<44px)
- Mix different border radius styles
- Overuse shadows (keep subtle)
- Use pure black (#000000)
- Ignore color meanings (red = error)

---

## Quick Reference

### Most Used Colors
```dart
Primary:        ZelusColors.primary        // #6366F1
Background:     ZelusColors.background     // #FAFAFC
Surface:        ZelusColors.surface        // #FFFFFF
Text Primary:   ZelusColors.textPrimary    // #0F172A
Text Secondary: ZelusColors.textSecondary  // #64748B
```

### Most Used Gradients
```dart
Primary:        ZelusColors.primaryGradient
Accent:         ZelusColors.accentGradient
Card:           ZelusColors.cardGradient
```

### Most Used Spacing
```dart
Small gap:      12px (height: 12)
Medium gap:     16px (height: 16)
Large gap:      20px (padding: 20)
Section gap:    32px (height: 32)
```

---

**Reference Version**: 2.0.0
**Last Updated**: October 20, 2025

