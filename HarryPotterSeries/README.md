# HarryPotter
-  사용자는 시리즈 버튼을 눌러 각 책의 제목, 커버 이미지, 헌정사, 요약, 목차 정보를 확인할 수 있습니다.
------------------------------------------------------------------------------

## 📌 프로젝트 개요
- 목표: JSON 파일로 저장된 해리포터 시리즈 데이터를 UI로 보여주는 앱 구현

- 사용 기술: Swift, UIKit, MVC 아키텍처, SnapKit

UI 구성:

- 책 제목 (TitleView)

- 책 커버 및 기본 정보 (BookInfoView)

- 헌정사 (DedicationView)

- 책 요약 (SummaryView)

- 챕터 리스트 (ChapterListView)

- 시리즈 전환 버튼 (SeriesButtonCell)
------------------------------------------------------------------------------------------------

## 📁 폴더 구조

📦HarryPotterBookApp
├── 📁Model
│   └── Book.swift
│
├── 📁View
│   ├── 📁Components
│   │   ├── TitleView.swift             // 책 제목 + 시리즈 순서 라벨
|   |   ├── BookCoverView.swift        // 표지 이미지만 담당
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
└── 📁Service
    ├── AlterManager
    └── DataService.swift               // JSON 파싱 로직

-----------------------------------------------------------------------------------
# ⚙️ 주요 기능 구현 과정
## ✅ JSON 데이터 로드
- DataService.swift 파일에서 loadBooks() 함수를 통해 books.json을 로드합니다.

- 실패 시 Alert 창을 띄워 사용자에게 에러 메시지를 전달합니다.
 
## ✅ 시리즈 버튼 기능
- SeriesButtonCell을 사용하여 각 책의 시리즈 버튼을 수평 스크롤로 보여줍니다.

- 버튼 클릭 시 해당 시리즈 책 정보를 UI에 동적으로 반영합니다.

- 선택된 버튼은 배경색이 파란색으로 바뀌며, 이전 버튼은 흰색으로 돌아갑니다.

------------------------------------------------------------------------------------

## ✅ UI 컴포넌트 구현
각 컴포넌트는 UIView 클래스를 상속받아 별도로 분리되었습니다.

- TitleView: 시리즈 순서와 제목 표시

- BookInfoView: 책 커버 이미지, 작가, 출판년도, 출판사 등

- DedicationView: 헌정사 표시

- SummaryView: 책 요약 표시

- ChapterListView: 챕터 목록을 UILabel 리스트로 구성
