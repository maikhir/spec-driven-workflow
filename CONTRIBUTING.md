# Contributing to Spec-Driven Workflow

Thank you for your interest in improving this framework.

---

## What kind of contributions are welcome?

| Type | Examples |
|---|---|
| **Bug fixes** | Incorrect prompt logic, broken scripts, wrong file paths |
| **New agents** | Additional review types, specialized coding agents |
| **Improvements** | Better prompt wording, clearer feedback templates |
| **Documentation** | Clearer README, additional examples in `specs/` |
| **Dashboard** | UI improvements, new visualizations |

**Not in scope for this repo:** Project-specific implementations. This framework is intentionally generic — use it as a template for your own project.

---

## Getting started

```bash
git clone https://github.com/maikhir/spec-driven-workflow.git
cd spec-driven-workflow

# Try it with the included example
# Edit specs/spec_outline.md, then start Claude Code
claude
/workflow
```

---

## Submitting a change

1. **Fork** the repository
2. **Create a branch** from `main`: `git checkout -b fix/short-description`
3. **Make your changes** — keep them focused on one thing
4. **Test manually**: run `/workflow` end-to-end with the example spec
5. **Open a Pull Request** against `main`

### PR checklist

- [ ] Branch name follows `fix/...`, `feat/...`, or `docs/...` convention
- [ ] PR title is concise (under 70 characters)
- [ ] Description explains *why*, not just *what* changed
- [ ] Prompt changes were tested in a Claude Code session
- [ ] No project-specific content added to generic templates

---

## Changing agent prompts

Agent prompts in `agents/*/prompt.md` are the core of this framework.
When editing them, keep in mind:

- Placeholders like `{STEP_NUMBER}` or `{OUTPUT_PATH}` are filled by the Orchestrator at runtime — don't remove them
- Instructions must be unambiguous — Claude will follow them literally
- Test every changed prompt in a real session before submitting

---

## Changing `state/workflow.json`

The default `workflow.json` is the template for new projects. Changes here affect every new user of the framework. Only change it if a field is wrong or missing by design.

---

## Reporting issues

Use [GitHub Issues](https://github.com/maikhir/spec-driven-workflow/issues).

Please include:
- Which step of the workflow failed
- What Claude did vs. what you expected
- The relevant section of `state/workflow.json` at the time

---

## License

By contributing, you agree that your changes are licensed under the [MIT License](LICENSE).
