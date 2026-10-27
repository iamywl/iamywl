# 🎨 [DESIGN_SYSTEM_AGENT.md] Global Elite Simple & Modern Design System Agent
> **System Role:** Principal UI/UX & Visual Design Systems Architect  
> **Target Account:** `@iamywl`  
> **Core Philosophy:** Toss TDS Clean White × Apple HIG Simplicity × Linear Surgical Craft  
> **Benchmark Standards:** Top 0.1% Global GitHub Contributors · Linear.app · Stripe · Toss · Apple Design Awards

---

## 1. 🌐 글로벌 탑 컨트리뷰터 & 디자인 철학 벤치마크 (Global Benchmarking)

본 문서는 전 세계 최상위 GitHub 오픈소스 코어 컨트리뷰터(Linux Foundation, Kubernetes Core, CNCF, Vercel, Linear) 및 LinkedIn Staff/Principal 엔지니어들의 프로필 디자인 성공 원칙을 체계화한 공식 명세입니다.

```
┌────────────────────────────────────────────────────────────────────────────────────────┐
│ [글로벌 엘리트 엔지니어 프로필 6대 디자인 원칙]                                        │
│ 1. 🌤️ Ceramic White × Space Gray 듀얼 캔버스: GitHub 테마에 무결점으로 반응하는 룩앤필  │
│ 2. 🎯 단일 시그니처 액센트(Single Primary Accent): Toss Blue (#3182F6)로 통일된 신뢰감  │
│ 3. 📐 Linear Surgical Precision: 1px 미세 테두리(Hairline Border)와 정밀한 Bento Grid │
│ 4. 🌬️ Generous Whitespace: 과도한 박스 감금을 없애고 호흡할 수 있는 쾌적한 정보 여백   │
│ 5. ⚡ Micro-Interactions: 정적인 그래픽 대신 은은하게 호흡하는 미세 파형 및 부드러운 눌림│
│ 6. 🛡️ 100% Privacy Lockdown: 익명성 보장 속에서 최상위 엔지니어링 임팩트 극대화      │
└────────────────────────────────────────────────────────────────────────────────────────┘
```

### 1.1 실패한 레거시 그래픽 디자인의 안티패턴 해부
1. **과도한 사이버펑크 & 네온 HUD (`visual-lab-hud.svg` 등):**
   - 90년대 오락실 게임기 같은 형광 청록/마젠타/라임 네온과 레이더 스위프는 엔지니어의 전문성을 가볍게 만들고 주니어/아마추어 인상을 줌.
2. **장난감 같은 오브젝트 (`cosmic-audio-player.svg` 회전 LP판 등):**
   - 개발 프로필의 본질(시스템, 아키텍처, 성능, 안정성)과 무관한 회전 바이닐과 무지개 이퀄라이저는 인지적 잡음(Cognitive Noise)만 유발함.
3. **무겁고 번쩍거리는 3D 플라스틱 키캡 (`3d-keycaps.svg`):**
   - 깃허브 뷰포트를 과도하게 점유하고 스크롤 피로도를 가중시킴.
4. **해결책:**
   - 이를 **Linear/Apple 감성의 정갈한 앰비언트 비주얼라이저(`focus_ambient`)**와 **Apple Magic Keyboard 스타일의 단축키 덱(`tactile_deck`)**으로 세련되게 승화시킴.

---

## 2. 🎨 디자인 토큰 시스템 (Design System Tokens)

### 2.1 Color Tokens (Light & Dark Mode)

```css
:root {
  /* [Light Mode] Toss TDS Clean White & Ceramic */
  --surface-base: #FFFFFF;
  --surface-subtle: #F8FAFC;
  --surface-card: #FFFFFF;
  --surface-badge: #EFF6FF;

  /* Typography */
  --text-primary: #0F172A;   /* Slate 900 - High Contrast Headline */
  --text-secondary: #334155; /* Slate 700 - Relaxed Reading Body */
  --text-muted: #64748B;     /* Slate 500 - Metadata & Captions */

  /* Primary Brand Accent (Toss Blue) */
  --accent-primary: #3182F6; /* Toss Signature Blue */
  --accent-hover: #1B64DA;
  --accent-tint: #EFF6FF;

  /* Status Tokens */
  --status-success: #10B981; /* Emerald Active */
  --status-warning: #F59E0B; /* Amber Alert */
  --status-danger: #EF4444;  /* Crimson Critical */
  --status-purple: #8B5CF6;  /* Royal Purple */

  /* Borders & Shadows */
  --border-hairline: #E2E8F0; /* 1px Apple Hairline */
  --border-focus: #BFDBFE;
  --shadow-ambient: 0 4px 20px -2px rgba(15, 23, 42, 0.05);
}

@media (prefers-color-scheme: dark) {
  :root {
    /* [Dark Mode] Apple Space Gray & GitHub Canvas */
    --surface-base: #0D1117;
    --surface-subtle: #161B22;
    --surface-card: #161B22;
    --surface-badge: #1F2937;

    /* Typography */
    --text-primary: #F0F6FC;   /* Clean White */
    --text-secondary: #C9D1D9; /* Light Silver */
    --text-muted: #8B949E;     /* Medium Slate */

    /* Primary Brand Accent */
    --accent-primary: #58A6FF; /* High-Contrast Blue */
    --accent-hover: #79B8FF;
    --accent-tint: #1F2937;

    /* Status Tokens */
    --status-success: #3FB950;
    --status-warning: #FBBF24;
    --status-danger: #F87171;
    --status-purple: #A78BFA;

    /* Borders & Shadows */
    --border-hairline: #30363D;
    --border-focus: #388BFD;
    --shadow-ambient: 0 4px 20px -2px rgba(0, 0, 0, 0.5);
  }
}
```

---

## 3. 📐 SVG 에셋 제작 및 컴포넌트 표준 규격

1. **듀얼 테마 네이티브 지원:**
   - 모든 비주얼 컴포넌트는 반드시 `*_light.svg`와 `*_dark.svg` 두 가지 규격으로 동시에 제작.
   - README 삽입 시 `<picture>` 태그와 `prefers-color-scheme` 미디어 쿼리를 사용하여 외부 자바스크립트 없이 네이티브로 렌더링.
2. **뷰박스(ViewBox) 표준화:**
   - 풀 와이드 배너 / 덱: `viewBox="0 0 850 H"` (`width="100%"` 자동 스케일링 대응).
   - 2열 그리드 카드: `viewBox="0 0 410 H"`.
3. **타이포그래피 스택:**
   - 헤드라인/본문: `-apple-system, BlinkMacSystemFont, "Pretendard", "Inter", sans-serif`.
   - 코드/지표/터미널: `"SFMono-Regular", Consolas, "Liberation Mono", Menlo, Courier, monospace`.
4. **애니메이션 원칙:**
   - GPU 가속 속성(`opacity`, `transform`)만 사용.
   - 속도: 부드러운 3초~6초 `ease-in-out` 호흡 주기 적용 (깜빡임이나 눈부심 금지).

---
*Maintained by Global Simple & Modern Design System Agent for @iamywl.*
