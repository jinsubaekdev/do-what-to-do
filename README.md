# do_what_to_do

Flutter 스터디를 위해 구현한 TodoList 앱

## 사용한 기술
- Isar (로컬 데이터베이스)
- Riverpod (상태관리)
- VelocityX (스타일)
- freezed (모델 관리)

## 프로젝트 구조
- assets
    - fonts
      - 폰트들
    - images
      - 이미지들
- lib
    - main.dart
    - common
        - const
            - colors.dart
            - dimensions.dart
        - theme
            - app_theme.dart
        - data
            - local
                - app_database.dart
                - collections
                    - todo_db_model.dart
        - widgets
            - 위젯들
    - features
        - todos
            - s_todos.dart
            - dummy_todos.dart
            - models
                - vo_todo.dart
                - vo_sub_todo.dart
            - state
                - todo_data_holder.dart
        - write_todo
            - s_write_todo.dart
            - models
                - controllable_sub_todo.dart
            - widgets
                - 위젯들
