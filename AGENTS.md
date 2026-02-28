# AGENTS.md

Guidelines for AI agents working in this repository.

## Repository Overview

This repository contains **Agent Skills** for AI agents following the [Agent Skills specification](https://agentskills.io/specification.md). Skills install to `.agents/skills/` (the cross-agent standard). This repo also serves as a **Claude Code plugin marketplace** via `.claude-plugin/marketplace.json`.

- **Name**: Coding Skills
- **GitHub**: [JordanCoin/codingskills](https://github.com/JordanCoin/codingskills)
- **Creator**: Jordan Coin Jackson
- **License**: MIT

## Repository Structure

```
codingskills/
├── .claude-plugin/
│   └── marketplace.json   # Claude Code plugin marketplace manifest
├── skills/                # Agent Skills
│   └── skill-name/
│       └── SKILL.md       # Required skill file
├── AGENTS.md              # This file
├── CLAUDE.md → AGENTS.md  # Symlink for Claude Code
├── CONTRIBUTING.md
├── LICENSE
├── README.md
└── install.sh             # Cross-project installer
```

## Build / Lint / Test Commands

**Skills** are content-only (no build step). Verify manually:
- YAML frontmatter is valid
- `name` field matches directory name exactly
- `name` is 1-64 chars, lowercase alphanumeric and hyphens only
- `description` is 1-1024 characters

## Agent Skills Specification

Skills follow the [Agent Skills spec](https://agentskills.io/specification.md).

### Required Frontmatter

```yaml
---
name: skill-name
description: What this skill does and when to use it. Include trigger phrases.
---
```

### Frontmatter Field Constraints

| Field         | Required | Constraints                                                      |
|---------------|----------|------------------------------------------------------------------|
| `name`        | Yes      | 1-64 chars, lowercase `a-z`, numbers, hyphens. Must match dir.   |
| `description` | Yes      | 1-1024 chars. Describe what it does and when to use it.          |
| `license`     | No       | License name (default: MIT)                                      |
| `metadata`    | No       | Key-value pairs (author, version, etc.)                          |

### Name Field Rules

- Lowercase letters, numbers, and hyphens only
- Cannot start or end with hyphen
- No consecutive hyphens (`--`)
- Must match parent directory name exactly

## How Agents Should Use These Skills

1. **On first use**: Run `detect-stack` to scan the codebase. It writes `.agents/stack-context.md` with detected language, framework, and conventions.
2. **Apply principles using your built-in knowledge of the detected stack.** These files teach principles and decision frameworks — you already know how the language works.
3. **For framework-specific details**: Use context7 MCP (`resolve-library-id` then `query-docs`) or web search to pull live docs. Don't guess at API specifics.

## When to Apply Each Principle

| Situation | Primary | Supporting |
|-----------|---------|------------|
| Adding a new feature | yagni | kiss, separation-of-concerns |
| Refactoring | separation-of-concerns, solid | dry, boy-scout-rule |
| Reviewing a PR | kiss, dry | law-of-demeter, convention-over-configuration |
| Fixing a bug | boy-scout-rule, kiss | separation-of-concerns |
| Designing module boundaries | separation-of-concerns, solid | law-of-demeter |
| Choosing between approaches | kiss, yagni | convention-over-configuration |
| Organizing project structure | convention-over-configuration, separation-of-concerns | solid |
| Reducing coupling | law-of-demeter, solid | separation-of-concerns |

## Stack-Specific Knowledge Strategy

**No static reference files per language.** Instead:

1. Agent detects the stack (via `detect-stack`)
2. Agent applies principles using built-in language knowledge
3. For specific framework APIs, agent uses context7 MCP or web search on demand

This keeps the skill collection lightweight and always current.
