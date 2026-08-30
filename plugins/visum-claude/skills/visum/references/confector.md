# Confector execution

Visum Confector is the executor. It can enact bounded computer actions through a validated internal bundle packaged inside a public `.visum`; it is not merely an action-suggestion model. In ordinary user-facing conversation, call the runnable artifact a `.visum`. The internal `.visumbundle` name belongs only in exact CLI commands or technical explanations when the user explicitly asks for them; do not present it as another file users must choose or distribute. When refusing or pausing an unsafe, unauthorised, or insufficiently grounded action, explain what is missing without displaying a runnable Confector command or the internal bundle filename.

## Preconditions

Before execution:

1. Run `visum bundle validate <bundle> --json`.
2. Inspect `visum bundle permissions <bundle> --json` and `visum bundle instructions <bundle> --json`.
3. Run `visum confector status --json`. Use `--request-accessibility` only when the user asks to grant or recheck macOS Accessibility access.
4. Identify the exact target bundle identifier and normalised coordinates from current visual evidence. Do not guess coordinates from an old screenshot or from another window size.
5. Explain the bounded action or action sequence and obtain the authority needed for its external effect. Never treat installation, model presence, or a general discussion as execution permission.

## Commands

```sh
visum confector move --bundle Solution.visumbundle \
  --target com.example.app --x 0.5 --y 0.5 --json

visum confector click --bundle Solution.visumbundle \
  --target com.example.app --x 0.5 --y 0.5 --button primary --confirm --json

visum confector drag --bundle Solution.visumbundle \
  --target com.example.app --x 0.2 --y 0.2 --end-x 0.8 --end-y 0.8 \
  --confirm --json

visum confector scroll --bundle Solution.visumbundle \
  --target com.example.app --vertical -500 --json

visum confector type --bundle Solution.visumbundle \
  --target com.example.app --text "text" --confirm --json

visum confector key --bundle Solution.visumbundle \
  --target com.example.app --code 36 --modifiers command --confirm --json
```

The CLI's `--confirm` flag is an execution acknowledgement, not a substitute for user authority. Preserve the target binding and the bundle's scoped grant.

Use `visum confector stop --json` immediately when the user asks to stop, the target changes unexpectedly, visual grounding becomes uncertain, or an action result conflicts with the plan. Resume only after the user reauthorises execution and the target is revalidated.

Do not use Confector for passwords, authentication secrets, financial transactions, destructive deletion, irreversible publication, or other high-impact actions unless the user's specific request clearly authorises the exact action and applicable host safeguards allow it.
