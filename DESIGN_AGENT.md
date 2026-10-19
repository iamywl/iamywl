# 🎨 [DESIGN_AGENT.md] Korean Clean & Toss Minimalist Profile Design Agent
> **System Role:** Principal Clean & Minimalist Profile Designer  
> **Target Account:** `@iamywl`  
> **Core Philosophy:** Toss TDS Clean White × Apple HIG Simplicity × Korean Top Tech Blog (Velog, MadPlay, 44BITS)  
> **Key Directives:** Bright Tone, High Readability, Zero AI Fluff, 100% Privacy Lockdown

---

## 1. 🔍 철저한 디자인 자료조사 및 벤치마크 분석 (Design Benchmark Research)

사용자가 제시한 국내 최상위 테크 블로그 및 깃허브 프로필(MadPlay, Velog 인기 프로필, 44BITS, Heoni Tech, Jiho 등)의 공통 성공 요인을 철저히 해부하고 정리한 표준입니다.

```
┌────────────────────────────────────────────────────────────────────────────────────────┐
│ [국내 인기 개발자 프로필 5대 황금 법칙]                                                │
│ 1. 🌤️ 화이트/라이트 캔버스(Clean Canvas): 어두운 네온 박스를 배제하고 깨끗한 화이트 배경 │
│ 2. 🌬️ 여백의 미(Generous Whitespace): 빽빽한 박스 대신 시야가 트이는 쾌적한 줄간격     │
│ 3. 🎯 단일 포인트 컬러(Single Accent): 알록달록 무지개 대신 '토스 블루(#3182F6)' 하나로 통일 │
│ 4. 📝 이력서급 정보 구조화(Resume-level IA): 소개 ➡️ 기술스택 ➡️ 프로젝트 ➡️ 통계 순서   │
│ 5. 👥 인간적인 신뢰감(Human Credibility): 공허한 AI 명언 대신 실질적인 시스템 엔지니어링 역량 │
└────────────────────────────────────────────────────────────────────────────────────────┘
```

### 1.1 실패한 레거시 디자인의 문제점 (Why the Dark Neon Failed)
1. **사이버펑크/게이밍 RGB의 촌스러움:**  
   검정 배경(`#080D1A`) 위에 라임 그린, 마젠타 핑크, 머스터드 옐로우 브라운이 뒤섞여 게임 디스코드 봇이나 90년대 오락실 같은 조잡한 인상을 줌.
2. **시각적 피로도:**  
   깃허브 기본 뷰(라이트 모드)와 심각한 대비 불일치를 일으키며, 채도 높은 형광색 텍스트가 가독성을 크게 떨어뜨림.
3. **무거운 컨테이너:**  
   모든 요소를 육중한 SVG 카드 안에 가둬두어 프로필 전체가 답답하고 무거워짐.

### 1.2 벤치마크 모델 분석 (MadPlay & Velog Gold Standards)
* **MadPlay 스타일:** 깔끔한 화이트/소프트 상단 배너 + 자연스러운 인삿말 + 가독성 높은 깃허브 통계 카드 + 직관적인 기술 블로그 링크.
* **44BITS & Velog 스타일:** 간결하고 군더더기 없는 불릿 포인트 + 통일된 규격의 플랫 배지 + 정돈된 프로젝트 목록.
* **토스(Toss) & 애플(Apple) 심미성:** 순백의 배경(`#FFFFFF`), 선명한 딥 차콜 헤드라인(`#191F28`), 소프트 슬레이트 바디(`#4E5968`), 그리고 단 하나의 신뢰감 있는 브랜드 블루(`#3182F6`).

---

## 2. 🎨 디자인 시스템 토큰 (Design System Tokens)

```css
:root {
  /* [Light Mode] Surface & Background (Toss Clean White & Ceramic) */
  --surface-base: #FFFFFF;
  --surface-card: #FFFFFF;
  --surface-subtle: #F8FAFC;
  --surface-badge: #EFF6FF;

  /* Typography (High Contrast Charcoal & Slate) */
  --text-headline: #0F172A; /* Slate 900 - Crystal Clear */
  --text-body: #334155;     /* Slate 700 - Relaxed Reading */
  --text-muted: #64748B;    /* Slate 500 - Secondary Metadata */

  /* Primary Brand Accent (Toss Blue) */
  --accent-primary: #3182F6; /* Toss Signature Blue */
  --accent-hover: #1B64DA;
  --accent-light: #EBF4FF;

  /* Status Accents (Restrained, NOT Neon) */
  --status-active: #10B981;  /* Soft Emerald */
  --status-active-bg: #ECFDF5;
  --status-metric: #2563EB;  /* Deep Royal Blue */

  /* Borders & Shadows */
  --border-delicate: #E2E8F0; /* 1px Hairline */
  --border-focus: #BFDBFE;
  --shadow-soft: 0 4px 20px -2px rgba(15, 23, 42, 0.05);
  --shadow-card: 0 8px 30px -4px rgba(15, 23, 42, 0.06);
}

@media (prefers-color-scheme: dark) {
  :root {
    /* [Dark Mode] Surface & Background (Apple Space Gray & GitHub Canvas) */
    --surface-base: #0D1117;
    --surface-card: #161B22;
    --surface-subtle: #0D1117;
    --surface-badge: #1F2937;

    /* Typography (High Contrast Clean White & Silver) */
    --text-headline: #F0F6FC; /* Clean White */
    --text-body: #C9D1D9;     /* Light Gray */
    --text-muted: #8B949E;    /* Silver Metadata */

    /* Primary Brand Accent */
    --accent-primary: #58A6FF; /* High Contrast Toss Blue */
    --accent-hover: #79B8FF;
    --accent-light: #1F2937;

    /* Status Accents */
    --status-active: #3FB950;  /* Subtle Green */
    --status-active-bg: #142D1E;
    --status-metric: #58A6FF;

    /* Borders & Shadows */
    --border-delicate: #30363D; /* 1px GitHub Dark Hairline */
    --border-focus: #388BFD;
    --shadow-soft: 0 4px 20px -2px rgba(0, 0, 0, 0.5);
    --shadow-card: 0 8px 30px -4px rgba(0, 0, 0, 0.6);
  }
}
```

---

## 3. 📐 프로필 레이아웃 구조 (Information Architecture)

```
┌────────────────────────────────────────────────────────────────────────┐
│ 1. 🌤️ Toss & Apple Clean Header Banner (부드러운 곡선 & 밝은 톤)       │
│    • "안녕하세요, Infrastructure & Security Architect @iamywl입니다." │
│    • 포트폴리오 & GitHub 깔끔한 액션 배지                              │
├────────────────────────────────────────────────────────────────────────┤
│ 2. 👤 About Me (핵심 전문 영역 & 엔지니어링 미션)                       │
│    • 리눅스 커널 트레이싱 (eBPF) & 런타임 보안 방어                    │
│    • 클라우드 네이티브 멀티 클러스터 K8s (Apple Silicon Tart VM)       │
│    • 제로트러스트 DevSecOps 파이프라인 & 고동시성 미들웨어            │
├────────────────────────────────────────────────────────────────────────┤
│ 3. 🛠️ Tech Stack (카테고리별 정돈된 배지 아스날)                       │
│    • Systems & Kernel / Cloud & K8s / SecOps & IaC / Backend           │
├────────────────────────────────────────────────────────────────────────┤
│ 4. 🚀 6대 핀 프로젝트 (화이트 프로스티드 카드 2x3 그리드)               │
│    • 통일된 화이트 세라믹 배경 + 토스 블루 하이라이트                  │
│    • 정량화된 핵심 지표 (< 1.2μs, 100k+ SYN/s, 99.9% Uptime) 각인     │
├────────────────────────────────────────────────────────────────────────┤
│ 5. 📊 Telemetry & Activity Radar (밝은 톤 통계 & 기여도 스네이크)       │
│    • 라이트 테마에 최적화된 시스템 메트릭 대시보드                     │
└────────────────────────────────────────────────────────────────────────┘
```

---

## 4. 🛡️ 프라이버시 원칙 (Absolute Anonymity)

1. **아이덴티티:** 오직 `@iamywl`만 표출.
2. **금지 항목:** 실명(국문/영문), 개인 이메일, 특정 대학 및 교육기관명 일체 영구 배제.
3. **연락처:** GitHub 공식 익명 노리플라이(`iamywl@users.noreply.github.com`) 또는 포트폴리오 사이트만 노출.

---
*Created by Korean Clean & Toss Minimalist Profile Design Agent.*
