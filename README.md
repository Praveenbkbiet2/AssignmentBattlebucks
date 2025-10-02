

# AssignmentBattlebucks

Chhota demo iOS app jo posts fetch aur display karta hai. Project SwiftUI use karta hai aur lightweight MVVM architecture follow karta hai.

## Quick setup

1. Repository clone karo ya workspace apne machine pe open karo.
2. Xcode project open karo: `AssignmentBattlebucks/AssignmentBattlebucks.xcodeproj`.
3. Simulator select karo (ya agar real device pe run karna hai to device select karo). Physical device ke liye project target -> Signing & Capabilities me apni Team set karo.
4. Build & Run (Cmd+R).

Notes:
- Koi external dependency manager use nahi hua — saare files plain Swift aur SwiftUI me hain.
- Device pe run karte waqt signing issues aaye to project target me valid Team select karo.

## iOS & Xcode versions

- Assumed / tested with: Xcode 15.x aur iOS 17.0 SDK (SwiftUI App lifecycle).
- Minimum target: iOS 14.0+ (project `AssignmentBattlebucksApp.swift` SwiftUI app entrypoint use karta hai).

Agar older Xcode/iOS support chahiye to batao, main code ko older Swift ya UIKit lifecycle ke liye adapt kar dunga.

## Project structure & MVVM explanation

Project simple MVVM pattern follow karta hai:

- Models/: Domain data types
  - `Post.swift` — post ka model.
- Services/: Networking aur error types
  - `PostsService.swift` — API se posts fetch karne ka logic.
  - `NetworkError.swift` — networking errors define karta hai.
- ViewModels/: Presentation logic aur state
  - `PostsViewModel.swift` — posts load karta hai, views ke liye @Published properties expose karta hai, error handling aur favorites manage karta hai.
- Views/: UI layer (SwiftUI)
  - `ContentView.swift`, `PostsListView.swift`, `PostRow.swift`, `PostDetailView.swift`, `FavoritesListView.swift` — UI components jo view models se bind hote hain.

Kaam ka division (MVVM):

- Model: Simple Swift structs, data decoding aur value semantics ke liye.
- ViewModel: Async kaam (network calls) handle karta hai, model data ko view-friendly form me transform karta hai, aur user actions ke methods provide karta hai.
- View: SwiftUI views view models ko observe karte hain aur UI render karte hain. Views ko zyada stateless aur declarative rakha gaya hai.

## Assumptions

- Network service predictable JSON return karta hai jo `Post` model se map hota hai.
- Koi external package manager use nahi kiya gaya — sab kuch Foundation aur Swift standard se implement hai.
- Favorites ka persistence abhi in-memory/ephemeral hai (time constraints ki wajah se permanent persistence implement nahi hua).

## Agar zyada time mile to main yeh improvements karunga

1. Networking
	- Pure `async/await` aur ek centralized network layer with protocol for easier testing/mocking.
	- Retry/backoff aur better error classification (client/server/offline).

2. Caching & Persistence
	- Local caching (Core Data/SQLite/file cache) aur favorites ko app launches ke beech persist karna.

3. Pagination & Performance
	- Pagination / infinite scrolling agar large datasets aaye.
	- Lazy image loading aur image caching.

4. Tests & CI
	- `PostsViewModel` ke liye unit tests with mocked `PostsService`.
	- UI tests for main flows aur CI pipeline (GitHub Actions/Bitrise) add karna.

5. Architecture & Extensibility
	- Dependency injection taaki services easily swappable aur testable hoon.
	- Common components extract karna aur multi-target separation improve karna.

6. Polish
	- Accessibility labels improve karna, dark/light mode polishing, localization scaffolding, aur UI animations refine karna.

## Files of interest

- `AssignmentBattlebucksApp.swift` — app entrypoint.
- `Models/Post.swift` — post model.
- `Services/PostsService.swift` — fetching logic.
- `ViewModels/PostsViewModel.swift` — main view model.
- `Views/` — SwiftUI views for app UI.

## Next steps / Contact

Chaho to main:
- `PostsViewModel` ke liye unit tests add kar sakta hoon (mock `PostsService`).
- Favorites persistence (UserDefaults ya Core Data) implement kar sakta hoon.
- Agar API auth ya API key chahiye to setup instructions add kar dunga.

---

Agar specific Xcode/iOS version pin karni ho ya koi extra run instructions chahiye (snapshot generation, env vars, CI), batao — main update kar dunga.
