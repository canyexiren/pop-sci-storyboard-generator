# 🎬 30秒科普拟人分镜提示词生成器 (`pop-sci-storyboard-generator`)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Agent Skill](https://img.shields.io/badge/Agent%20Skill-SKILL.md-blue.svg)](SKILL.md)
[![Agents](https://img.shields.io/badge/Agents-Claude%20Code%20%7C%20Cursor%20%7C%20Codex%20%7C%20Cline%20%7C%20Copilot-8A2BE2.svg)](#-全平台-agent-一键安装指南)
[![GitHub stars](https://img.shields.io/github/stars/canyexiren/pop-sci-storyboard-generator?style=social)](https://github.com/canyexiren/pop-sci-storyboard-generator/stargazers)

一个符合**跨平台通用 Agent Skill 规范**的 AI 技能包。输入任意自然、生物、历史、科学类科普文案，自动拆解生成 **30秒（6镜头）** 的 AI 视频分镜脚本与画面提示词，统一采用**「外国真人专家主讲 + 写实拟人化生物配合解说」**的硬核科普叙事风格。

---

## 🚀 全平台 Agent 一键安装指南

本仓库同时兼容 `SKILL.md` 开放标准（Claude Code / Vercel Skills CLI / OpenHands / Codex CLI / Goose / Cline / Roo Code）、`AGENTS.md` 规范、Cursor `.mdc` 规则以及 GitHub Copilot 指令。

### 方式 1：使用通用 `npx skills` CLI 安装（推荐，自动适配当前 Agent）
支持 Claude Code、Cursor、Windsurf、Cline、Roo Code、GitHub Copilot、OpenHands、Codex 等主流 Agent：
```bash
npx skills add canyexiren/pop-sci-storyboard-generator
```

### 方式 2：使用一键安装脚本（macOS / Linux / WSL）
自动安装至全局 `~/.claude/skills/`、`~/.agents/skills/` 及当前项目的 `.cursor/rules/`：
```bash
curl -fsSL https://raw.githubusercontent.com/canyexiren/pop-sci-storyboard-generator/main/install.sh | bash -s -- https://github.com/canyexiren/pop-sci-storyboard-generator.git
```

### 方式 3：按具体 Agent 手动安装

- **Claude Code**：
  ```bash
  mkdir -p ~/.claude/skills/pop-sci-storyboard-generator
  curl -fsSL https://raw.githubusercontent.com/canyexiren/pop-sci-storyboard-generator/main/SKILL.md -o ~/.claude/skills/pop-sci-storyboard-generator/SKILL.md
  ```
- **Cursor IDE**：
  将 `.cursor/rules/pop-sci-storyboard-generator.mdc` 复制到项目目录的 `.cursor/rules/` 下即可按语义自动触发。
- **Cline / Roo Code / Windsurf / OpenAI Codex**：
  直接将根目录下的 `SKILL.md` 或 `AGENTS.md` 放入项目的 `.clinerules/`、`.windsurf/rules/` 或项目根目录。

---

## 📂 仓库多 Agent 兼容结构

```text
pop-sci-storyboard-generator/
├── SKILL.md                                         # 根目录通用 Agent Skill 定义 (Claude / Skills CLI / Cline)
├── AGENTS.md                                        # OpenAI Codex / Jules / Windsurf / Aider 通用规范文件
├── package.json                                     # NPM / npx skills 元数据声明
├── LICENSE                                          # MIT 开源许可
├── .gitattributes                                   # 强制 LF 换行（保证 install.sh 在 bash 下可执行）
├── install.sh                                       # 跨平台一键安装脚本
├── publish_to_github.sh                             # GitHub CLI 一键建仓与发布脚本
├── skills/
│   └── pop-sci-storyboard-generator/
│       └── SKILL.md                                 # 标准多技能目录结构 (兼容 npx skills add 子目录扫描)
├── .claude/
│   └── commands/
│       └── pop-sci-storyboard.md                    # Claude Code 斜杠命令 (/pop-sci-storyboard)
├── .cursor/
│   └── rules/
│       └── pop-sci-storyboard-generator.mdc         # Cursor IDE 自动触发规则
└── .github/
    └── prompts/
        └── pop-sci-storyboard.prompt.md             # GitHub Copilot 可复用 Prompt
```

---

## 💡 触发方式与使用示例

安装完成后，直接向你的 Agent 发送任意科普文案即可触发：

> **输入示例**：
> 「把这段文案做成30秒真人加拟人生物科普分镜：人类的胃酸足以溶解铁钉，连绝大多数细菌进去都会瞬间灰飞烟灭；但幽门螺杆菌却能靠着螺旋钻头钻进胃黏膜，甚至分泌尿素酶在自己周围撑起一把防酸保护伞。」

Agent 将严格按照 **6个镜头（0-30s）、外国专家真人主讲 + 中度写实拟人生物同框、四维画面提示词（主体/场景/镜头语言/8K纪实画质）+ 口语化解说词** 标准输出。

---

## 🛠 发布与更新

仓库已内置一键建仓脚本（需先 `gh auth login`）：

```bash
bash publish_to_github.sh
```

日常更新：

```bash
git add -A && git commit -m "docs: update skill" && git push
```

---

## 🤝 贡献

欢迎提交 Issue 与 PR 改进分镜规则、镜头语言词库与适配更多 Agent 平台。提交前请保持 `SKILL.md` 的 frontmatter（`name` / `description` / `version` / `license`）完整。

## 📄 License

本项目基于 [MIT License](LICENSE) 开源，Copyright © 2026 canyexiren。

