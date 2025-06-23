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

![Screenshot 2025-06-23 at 5 49 36 pm](https://github.com/user-attachments/assets/a0ae25bc-599e-4e0d-8185-33fb5adc9a99)

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

-------------------------------------------------------------------------------------
## 결과

![Simulator Screensho![simulator_screenshot_04E896B5-B1C5-4959-BCBF-0E5E5F9AD129](https://github.com/user-attachments/assets/12955386-b35d-4a87-89c4-0e50b7299edc)
t - iPhone 16 Pro - 2025-06-23 at 17 55 02](https://github.com/user-attachments/assets/7e23cc7a-5495-43b2-b5b9-99162ff72a2e)
![simulator_screenshot_EDBDC9F5-57F4-42B0-8AC3-4DD3B67B339F](https://github.com/user-attachments/assets/38db855c-1af9-4fbe-829c-e8459d2f1fde)
![simulator_screenshot_A0206030-D989-4644-A5B4-366B99D004D9](https://github.com/user-attachments/assets/f04fe469-c6c6-4b7a-b27e-b3ae705fdcbf)

