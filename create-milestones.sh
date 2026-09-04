#!/bin/zsh

FONT="/System/Library/Fonts/Helvetica.ttc"
OUT="devsecops-milestones.png"

magick -size 1600x1000 xc:"#0f172a" \
  -font "$FONT" \
  \
  -fill white -pointsize 42 -gravity North \
  -annotate +0+35 "DEVSECOPS LAB" \
  \
  -fill "#93c5fd" -pointsize 20 \
  -annotate +0+88 "GitHub Project • Milestones & Tasks" \
  \
  \
  -fill "#1e293b" -draw "roundrectangle 70,150 530,390 18,18" \
  -fill "#22c55e" -draw "roundrectangle 70,150 530,162 6,6" \
  \
  -fill white -pointsize 25 \
  -annotate +100+205 "Milestone 1 — Foundation" \
  \
  -fill "#cbd5e1" -pointsize 18 \
  -annotate +105+245 "✓ Git repository" \
  -annotate +105+278 "✓ Python / FastAPI" \
  -annotate +105+311 "✓ pytest" \
  \
  -fill "#4ade80" -pointsize 17 \
  -annotate +100+360 "FOUNDATION" \
  \
  \
  -fill "#1e293b" -draw "roundrectangle 570,150 1030,390 18,18" \
  -fill "#3b82f6" -draw "roundrectangle 570,150 1030,162 6,6" \
  \
  -fill white -pointsize 25 \
  -annotate +600+205 "Milestone 2 — Containerization" \
  \
  -fill "#cbd5e1" -pointsize 18 \
  -annotate +605+245 "• Podman" \
  -annotate +605+278 "• Containerfile" \
  -annotate +605+311 "• FastAPI container" \
  -annotate +605+344 "• Port 8000" \
  \
  \
  -fill "#1e293b" -draw "roundrectangle 1070,150 1530,390 18,18" \
  -fill "#f59e0b" -draw "roundrectangle 1070,150 1530,162 6,6" \
  \
  -fill white -pointsize 25 \
  -annotate +1100+205 "Milestone 3 — Security" \
  \
  -fill "#cbd5e1" -pointsize 18 \
  -annotate +1105+245 "• Bandit" \
  -annotate +1105+278 "• pip-audit" \
  -annotate +1105+311 "• Gitleaks" \
  -annotate +1105+344 "• Trivy" \
  \
  \
  -fill "#1e293b" -draw "roundrectangle 70,430 530,720 18,18" \
  -fill "#a855f7" -draw "roundrectangle 70,430 530,442 6,6" \
  \
  -fill white -pointsize 25 \
  -annotate +100+485 "Milestone 4 — Infrastructure" \
  \
  -fill "#cbd5e1" -pointsize 18 \
  -annotate +105+525 "✓ Terraform" \
  -annotate +105+558 "✓ Ansible" \
  -annotate +105+591 "✓ SSH / Ubuntu VM" \
  -annotate +105+624 "✓ Podman automation" \
  -annotate +105+657 "• Terraform provisioning" \
  -annotate +105+690 "• Terraform → Ansible" \
  \
  \
  -fill "#1e293b" -draw "roundrectangle 570,430 1030,720 18,18" \
  -fill "#06b6d4" -draw "roundrectangle 570,430 1030,442 6,6" \
  \
  -fill white -pointsize 25 \
  -annotate +600+485 "Milestone 5 — CI/CD" \
  \
  -fill "#cbd5e1" -pointsize 18 \
  -annotate +605+530 "• GitHub Actions" \
  -annotate +605+563 "• Automated pytest" \
  -annotate +605+596 "• Security scanning" \
  -annotate +605+629 "• Container build" \
  -annotate +605+662 "• Trivy in CI" \
  \
  \
  -fill "#1e293b" -draw "roundrectangle 1070,430 1530,720 18,18" \
  -fill "#ef4444" -draw "roundrectangle 1070,430 1530,442 6,6" \
  \
  -fill white -pointsize 25 \
  -annotate +1100+485 "Milestone 6 — Deployment" \
  \
  -fill "#cbd5e1" -pointsize 18 \
  -annotate +1105+530 "• Terraform infrastructure" \
  -annotate +1105+563 "• Ansible configuration" \
  -annotate +1105+596 "• Podman deployment" \
  -annotate +1105+629 "• FastAPI :8000" \
  -annotate +1105+662 "• Trivy verification" \
  -annotate +1105+695 "• End-to-end automation" \
  \
  \
  -fill "#020617" -draw "roundrectangle 70,760 1530,930 18,18" \
  \
  -fill white -pointsize 24 \
  -annotate +800+805 "DevSecOps Flow" \
  \
  -fill "#93c5fd" -pointsize 22 \
  -annotate +800+855 "GitHub → Terraform → Ansible → Podman → FastAPI → Trivy" \
  \
  -fill "#94a3b8" -pointsize 17 \
  -annotate +800+895 "Mac → SSH → Ubuntu VM → Automated Deployment" \
  \
  "$OUT"

echo "Created: $OUT"

