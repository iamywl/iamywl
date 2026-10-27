# ⚙️ [DEVELOPMENT_AGENT.md] CI/CD Automation & Idempotency Pipeline Agent
> **System Role:** Principal CI/CD, GitOps & Automation Infrastructure Architect  
> **Target Account:** `@iamywl`  
> **Core Directives:** 100% Idempotent Workflows · Zero-Loop CI Gates · Deterministic State Sync

---

## 1. 🔄 3대 핵심 자동화 파이프라인 아키텍처

본 에이전트는 `@iamywl` 프로필 저장소의 모든 동적 시각화 데이터가 외부 수동 개입 없이 자율적이고 안정적으로 갱신되도록 관리합니다.

```
┌─────────────────────────────────────────────────────────────────────────────────────────┐
│ [GitHub Actions 3대 자동화 파이프라인]                                                   │
│                                                                                         │
│  [Schedule: 18:00 UTC] ───► profile-3d-contrib.yml ───► 3D Isometric Grass (GitBlock)    │
│  [Schedule: 19:00 UTC] ───► profile-summary-cards.yml ─► Language Breakdown Cards       │
│  [Schedule: Every 12h] ───► snake.yml ────────────────► Autonomous Snake Grid (output) │
└─────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## 2. 🛡️ 멱등성(Idempotency) 보장 표준 원칙

모든 깃허브 액션 스크립트와 로컬 자동화 툴은 **수천 번 반복 실행되어도 동일한 상태를 유지**해야 합니다.

### 2.1 커밋 무결성 및 무한 루프 방지 (`[skip ci]`)
1. **변경 감지 조건문:**  
   데이터가 변경되지 않은 경우 불필요한 빈 커밋을 생성하지 않습니다.
   ```bash
   git diff --staged --quiet || (git commit -m "chore: update assets [skip ci]" && git push)
   ```
2. **CI 트리거 무한 루프 차단:**  
   자동 커밋 메시지에 반드시 `[skip ci]` 태그를 삽입하여 불필요한 GitHub Actions 재귀 트리거를 영구 차단합니다.
3. **권한 격리:**  
   워크플로우 파일에 `permissions: contents: write`를 명시하여 최소 권한 원칙(Principle of Least Privilege)을 준수합니다.

---

## 3. 📂 워크플로우 명세 및 구성

### 3.1 `profile-3d-contrib.yml` (3D 복셀 잔디)
- **주기:** 매일 18:00 UTC (03:00 KST) & `workflow_dispatch`
- **산출물:** `profile-3d-contrib/` 내 `profile-gitblock.svg`, `profile-night-view.svg` 등
- **사용 액션:** `yoshi389111/github-profile-3d-contrib@latest`

### 3.2 `profile-summary-cards.yml` (프로필 요약 카드)
- **주기:** 매일 19:00 UTC (04:00 KST) & `workflow_dispatch`
- **산출물:** `profile-summary-card-output/` 내 언어 점유율 카드
- **테마:** `github` (심플 모던 클린 테마)

### 3.3 `snake.yml` (자율 스네이크 애니메이션)
- **주기:** 12시간마다 & `workflow_dispatch`
- **타깃 브랜치:** `output` 브랜치 (메인 커밋 로그 오염 방지)
- **팔레트:** 라이트 모드 Toss Blue (`#3182F6`), 다크 모드 High-Contrast Blue (`#58A6FF`)

---

## 4. 🛠️ 로컬 개발 및 유지보수 명령어 가이드

```bash
# 1. QA 무결성 테스트 실행
bash scripts/qa_verify.sh

# 2. 로컬 상태 변경 확인 (멱등성 점검)
git status --porcelain

# 3. 브랜치 동기화 확인
git remote -v
```

---
*Maintained by CI/CD Automation & Idempotency Pipeline Agent for @iamywl.*
