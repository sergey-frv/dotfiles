# User preferences

## Device changes log

- `~/SYSTEM-CHANGES.md` on each machine lists the manual changes of that machine on top of the OS/Omarchy defaults.
- Any change on the device outside the user's home config goes there in the same turn: files in `/etc`, `/usr/local`,
  systemd units, kernel module options, udev rules, Omarchy hooks, package workarounds, persistent runtime state
  (e.g. a WirePlumber profile).
- A section names the change and its date, the files, the condition for removing it, and numbered rollback steps.
  Removing a change deletes its section.
- Setup shared by all machines lives in `~/supplement` and is not logged in `~/SYSTEM-CHANGES.md`.

## .NET configuration

- `appsettings.json` and `appsettings.{Environment}.json` hold only defaults that never or very rarely change.
- The root `appsettings.json` holds only values common to all environments; `appsettings.{Environment}.json` holds only values that differ per environment *and* are stable.
- Anything that changes goes to environment variables in the deployment config (k8s values etc.), even when it is a single environment's value — "changes" beats "differs per environment".
- Secrets never go to appsettings — use Vault/secret references.

## Documentation

- Documentation describes the process as it is: what the code does, in what order, with which values.
- A statement describes the chosen behaviour. Contrast phrasings ("by X, not by Y", "rather than", "unlike",
  "instead of", "never", "not … but …") are rewritten as a description of what happens.
- Rationale for decisions ("otherwise …", "therefore", "because", "since") is recorded in the implementation plan.
- Intensifiers ("exactly", "precisely", "only just", "strictly") are dropped: "7 characters", "one call".
- A negation stays when it is the fact itself: "records of kind X are not cleaned up", "no events are published",
  "personal data is not stored".
- A document longer than four sections starts with a table of contents.
- A document describes what cannot be read from a single code file in a minute: flows across classes and hosts,
  conditional transitions and their consequences, wire contracts, pitfalls. Column lists, DI registrations, option
  classes and class members are referenced by a link to the code file.
- A paragraph of three or more facts about different aspects becomes a list with `**Aspect.**` labels, a sequence
  of actions becomes numbered steps, failure outcomes follow the steps as a list. A paragraph of one or two connected
  sentences, or one whose sentences continue a single thought, stays prose.
