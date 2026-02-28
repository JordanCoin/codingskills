# Contributing

Thanks for your interest in improving Coding Skills! This guide will help you add new skills or improve existing ones.

## Requesting a Skill

Suggest new coding principles by [opening an issue](https://github.com/JordanCoin/codingskills/issues/new).

## Improving an Existing Skill

The best contributions are:
- Better examples (especially language-specific ones that are still principle-focused)
- Sharper anti-patterns from real-world experience
- Boundary clarifications (when NOT to apply a principle)
- Code review checklist additions

## Adding a New Skill

### 1. Create the skill directory

```bash
mkdir -p skills/your-skill-name
```

### 2. Create the SKILL.md file

Every skill needs a `SKILL.md` file with YAML frontmatter:

```yaml
---
name: your-skill-name
description: When to use this skill. Include trigger phrases that help agents identify relevant tasks.
metadata:
  version: 1.0.0
---

# Your Skill Name

## Before Applying

If `.agents/stack-context.md` exists, read it first. Apply this principle using idiomatic patterns for the detected stack. For framework-specific details, use context7 MCP or web search — don't guess.

## Principle

One sentence that captures the core idea.

## Why This Matters in Production

Why this principle prevents real outages, bugs, and maintenance nightmares.

## Rules

Numbered, actionable rules.

## Anti-Patterns

What violations look like in real code.

## Examples

Before/after code showing the principle applied. Keep examples language-agnostic.

## Boundaries

When NOT to apply this principle. Every principle has limits.

## Code Review Checklist

Checkbox items for agents reviewing code against this principle.

## Related Skills

Links to other skills that complement or tension with this one.
```

### 3. Follow the naming conventions

- **Directory name**: lowercase, hyphens only (e.g., `my-principle`)
- **Name field**: must match directory name exactly
- **Description**: 1-1024 characters, include trigger phrases

### 4. Update install.sh

Add your skill name to the `SKILLS` array in `install.sh`.

### 5. Update marketplace.json

Add `./skills/your-skill-name` to the skills array in `.claude-plugin/marketplace.json`.

### 6. Update README.md

Add a row to the skills table in README.md.

## Design Principles for Skills

- **Language-agnostic**: Examples should use pseudocode or be clearly applicable to any language
- **Production-focused**: Every rule should connect to a real production consequence
- **Honest about boundaries**: Every principle has limits and tensions with other principles — document them
- **Actionable over academic**: Rules should be things an agent can check, not abstract philosophy
- **Concise**: Keep SKILL.md under 100 lines. If you need more, the skill might be too broad — consider splitting it.

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
