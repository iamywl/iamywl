# 🔍 [QA_VERIFICATION_AGENT.md] Quality Assurance & Integrity Verification Agent
> **System Role:** Principal QA, Static Analysis & Integrity Verification Architect  
> **Target Account:** `@iamywl`  
> **Target Metrics:** 100% Zero Broken Links · 100% Valid XML · 100% Privacy Compliance · Idempotent Execution

---

## 1. 🛡️ 5단계 무결성 검증 파이프라인 (5-Stage Verification Protocol)

본 에이전트는 프로필 레포지토리의 모든 파일이 커밋 및 푸시되기 전에 단 하나의 오류도 없도록 5단계에 걸친 정적 분석과 검증을 자동 수행합니다.

```
┌─────────────────────────────────────────────────────────────────────────────────────────┐
│ [5-Stage QA Verification Pipeline]                                                      │
│                                                                                         │
│  1. [XML Syntax Gate] ──────► 모든 SVG 파일의 Well-formed XML 유효성 검증                │
│  2. [Link Integrity Gate] ──► README.md 내 모든 로컬 상대경로 파일 실재 여부 검증        │
│  3. [Dual-Theme Gate] ──────► light.svg와 dark.svg 쌍(Pair) 일치 및 <picture> 매핑 확인  │
│  4. [Privacy Gate] ─────────► 실명, 개인 메일, 기관명 노출 여부 정규식 전수 조사       │
│  5. [Idempotency Gate] ─────► 반복 실행 시 불필요한 상태 변경(Dirty State) 없는지 확인   │
└─────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## 2. 🧪 QA 테스트 명세 및 검증 항목

### 2.1 Stage 1: SVG XML Syntax Validation
- `assets/*.svg` 및 `profile-3d-contrib/*.svg`의 닫는 태그, 네임스페이스(`xmlns="http://www.w3.org/2000/svg"`), 속성 유효성을 검사합니다.

### 2.2 Stage 2: Local File Link Integrity
- `README.md` 내에 참조된 `./assets/...`, `./profile-3d-contrib/...`, `./AGENTS/...` 경로가 파일 시스템에 100% 존재하는지 전수 검사합니다.

### 2.3 Stage 3: Dual-Theme Picture Mapping
- 라이트 모드 이미지와 다크 모드 이미지가 누락 없이 매칭되어 테마 전환 시 레이아웃 깨짐이 없는지 검사합니다.

### 2.4 Stage 4: Privacy Leakage Lockdown
- 개인 실명, `@naver.com`, `@gmail.com` 등의 개인 메일, 특정 사설 학원/대학명이 README 및 공개 에셋에 노출되지 않았는지 검사합니다.

### 2.5 Stage 5: Idempotency & Workflow Integrity
- 워크플로우 YAML 파일의 문법 검증 및 스크립트 실행 후 `git diff` 결과가 멱등성을 유지하는지 확인합니다.

---

## 3. 🚀 자동화된 실행 스크립트
모든 검증은 프로젝트 루트에서 아래 단 한 줄의 명령어로 실행됩니다:
```bash
bash scripts/qa_verify.sh
```

---
*Maintained by QA & Integrity Verification Agent for @iamywl.*
