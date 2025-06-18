# HarryPotter

<img width="741" alt="Screenshot 2025-06-16 at 4 49 36 pm" src="https://github.com/user-attachments/assets/cd325ebf-4880-4723-874c-cf53242f41ed" />
📦HarryPotterBookApp
├── 📁Model
│   ├── Book.swift
│   ├── Chapter.swift (선택 사항)
│   └── BookStateManager.swift  // 더보기/접기 상태 저장용 (UserDefaults 등)
│
├── 📁View
│   ├── 📁Components
│   │   ├── TitleView.swift             // 책 제목 + 시리즈 순서 라벨
|   |   ├──  BookCoverView.swift        // 표지 이미지만 담당
│   │   ├── BookInfoView.swift          // 책 표지, 제목, 저자, 출간일, 페이지수
│   │   ├── DedicationView.swift        // 헌정사
│   │   ├── SummaryView.swift           // 요약 (더보기/접기 포함)
│   │   └── ChapterListView.swift       // 목차 (UIScrollView + StackView)
│   │
│   ├── 📁Cells
│   │   └── SeriesButtonCell.swift      // 시리즈 버튼 (선택 시 데이터 변경)
│   │
│   └── 📁Resources
│       ├── 📁Assets.xcassets            // 이미지 및 색상 자원
│       └── 📁data
│           └── data.json               // 책 데이터
│
├── 📁Controller
│   └── BookViewController.swift        // 전체 View들을 조합하는 VC
│
├── 📁Service

│   └── DataService.swift               // JSON 파싱 로직
│
└── 📁Utils
    ├── DateFormatter+.swift            // 날짜 변환용 익스텐션
    └── UIView+.swift                   // UI관련 공통 확장자


