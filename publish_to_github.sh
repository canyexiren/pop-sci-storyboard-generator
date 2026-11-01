#!/usr/bin/env bash
set -e

REPO_NAME="pop-sci-storyboard-generator"

if ! command -v gh &> /dev/null; then
  echo "未检测到 GitHub CLI (gh)。请先安装 gh (https://cli.github.com/) 并执行 'gh auth login'，或手动通过 git push 上传。"
  exit 1
fi

git init
git branch -M main
git add .
git commit -m "feat: initial release of pop-sci-storyboard-generator universal agent skill"

# 自动获取当前登录的 GitHub 用户名并替换安装脚本中的占位符
GH_USER=$(gh api user -q .login)
if [ -n "$GH_USER" ]; then
  sed -i.bak "s/YOUR_USERNAME/$GH_USER/g" README.md install.sh
  rm -f README.md.bak install.sh.bak
  git add README.md install.sh
  git commit --amend --no-edit
fi

gh repo create "$REPO_NAME" --public --source=. --remote=origin --push
echo "✅ 已成功发布到: https://github.com/$GH_USER/$REPO_NAME"
