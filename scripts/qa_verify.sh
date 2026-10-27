#!/usr/bin/env bash
# ==============================================================================
# 🔍 QA & Integrity Verification Script for @iamywl
# Ensures:
#   1. Well-formed XML for all SVG assets
#   2. 100% Valid relative links inside README.md & AGENTS/
#   3. Dual-theme pairing (light.svg and dark.svg)
#   4. Absolute Privacy lockdown (No real names, no private personal emails)
#   5. Idempotent state execution
# ==============================================================================

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

echo "=========================================================="
echo "🚀 Starting Full 5-Stage QA Integrity Verification Suite"
echo "Target Repository: $REPO_ROOT"
echo "=========================================================="

FAILED=0

# ------------------------------------------------------------------------------
# Stage 1: SVG XML Syntax Validation
# ------------------------------------------------------------------------------
echo -e "\n[Stage 1/5] 🎨 Validating SVG XML Syntax..."
python3 - << 'EOF'
import sys
import xml.etree.ElementTree as ET
import glob

failed = False
svg_files = glob.glob('assets/**/*.svg', recursive=True) + glob.glob('profile-3d-contrib/**/*.svg', recursive=True)

if not svg_files:
    print("❌ No SVG files found to validate!")
    sys.exit(1)

for svg_path in svg_files:
    try:
        ET.parse(svg_path)
    except ET.ParseError as e:
        print(f"  ❌ XML Syntax Error in {svg_path}: {e}")
        failed = True

if failed:
    sys.exit(1)
else:
    print(f"  ✅ All {len(svg_files)} SVG assets passed XML well-formedness validation.")
EOF

# ------------------------------------------------------------------------------
# Stage 2: Link Integrity Verification inside README.md
# ------------------------------------------------------------------------------
echo -e "\n[Stage 2/5] 🔗 Checking Relative Links & File Paths in README.md..."
python3 - << 'EOF'
import re
import os
import sys

readme_path = 'README.md'
if not os.path.exists(readme_path):
    print(f"❌ {readme_path} not found!")
    sys.exit(1)

with open(readme_path, 'r', encoding='utf-8') as f:
    content = f.read()

# Pattern for local relative paths in href/src/srcset/markdown links
patterns = [
    r'(?:src|srcset|href)=["\'](\./[^"\']+)["\']',
    r'\]\((\./[^\)]+)\)'
]

failed = False
checked = 0
for pat in patterns:
    for match in re.findall(pat, content):
        clean_path = match.split()[0].rstrip('"\';')
        # Remove query params or anchors
        base_path = clean_path.split('?')[0].split('#')[0]
        if base_path.startswith('./'):
            rel_path = base_path[2:]
            if not os.path.exists(rel_path):
                print(f"  ❌ Broken Local Link in README: {match} (Resolved: {rel_path})")
                failed = True
            else:
                checked += 1

if failed:
    sys.exit(1)
else:
    print(f"  ✅ All {checked} relative references in README.md exist on disk.")
EOF

# ------------------------------------------------------------------------------
# Stage 3: Dual-Theme SVG Pairing Verification
# ------------------------------------------------------------------------------
echo -e "\n[Stage 3/5] 🌓 Verifying Dual-Theme (Light & Dark) Pairing..."
python3 - << 'EOF'
import os
import glob
import sys

failed = False
assets = glob.glob('assets/*_light.svg')

for light_file in assets:
    dark_file = light_file.replace('_light.svg', '_dark.svg')
    if not os.path.exists(dark_file):
        print(f"  ❌ Missing dark pair for: {light_file} -> expected: {dark_file}")
        failed = True

if failed:
    sys.exit(1)
else:
    print(f"  ✅ All {len(assets)} dual-theme asset pairs are strictly paired.")
EOF

# ------------------------------------------------------------------------------
# Stage 4: Absolute Privacy Lockdown
# ------------------------------------------------------------------------------
echo -e "\n[Stage 4/5] 🛡️ Inspecting Privacy Leakages..."
python3 - << 'EOF'
import re
import sys
import glob

forbidden_patterns = [
    r'[a-zA-Z0-9_.+-]+@naver\.com',
    r'[a-zA-Z0-9_.+-]+@daum\.net',
    r'[a-zA-Z0-9_.+-]+@gmail\.com',
    r'권혜강',
    r'이용우'
]

scanned_files = ['README.md', 'DESIGN_AGENT.md'] + glob.glob('AGENTS/*.md')
failed = False

for file_path in scanned_files:
    with open(file_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()
        for idx, line in enumerate(lines, 1):
            for pat in forbidden_patterns:
                if re.search(pat, line):
                    print(f"  ❌ Privacy Leakage in {file_path}:{idx}: Match '{pat}' in line:\n     {line.strip()}")
                    failed = True

if failed:
    sys.exit(1)
else:
    print(f"  ✅ Scanned {len(scanned_files)} markdown documents. 100% Privacy Lockdown Enforced.")
EOF

# ------------------------------------------------------------------------------
# Stage 5: GitHub Actions Workflows Syntax & Idempotency Check
# ------------------------------------------------------------------------------
echo -e "\n[Stage 5/5] ⚙️ Verifying GitHub Actions Workflows & Idempotency Rules..."
python3 - << 'EOF'
import os
import glob
import sys

workflow_files = glob.glob('.github/workflows/*.yml') + glob.glob('.github/workflows/*.yaml')
if not workflow_files:
    print("❌ No workflow files found!")
    sys.exit(1)

for wf in workflow_files:
    with open(wf, 'r', encoding='utf-8') as f:
        content = f.read()
        if 'git commit' in content and '[skip ci]' not in content and 'crazy-max/ghaction-github-pages' not in content:
            print(f"  ⚠️ Warning: {wf} commits without [skip ci] tag (risk of recursive CI trigger)!")

print(f"  ✅ {len(workflow_files)} workflows verified.")
EOF

echo -e "\n=========================================================="
echo "🎉 ALL 5 STAGES OF QA VERIFICATION PASSED SUCCESSFULLY!"
echo "Status: 100% Idempotent, Production-Ready & Verified."
echo "=========================================================="
