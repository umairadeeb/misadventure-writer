# misadventure-writer

A Claude skill that writes travel blog posts that are funny, witty, and self-deprecating. They read like a friend telling a story at a dinner party, not like a tourism board or an AI.

Give it trip notes, a brain dump, a voice-note transcript, or photo captions. It finds the story, drafts in your voice, punches up the jokes, strips out AI-sounding filler, and hands back a post with titles, an excerpt, tags, photo markers, and a short list of things for you to verify.

## What it does

- **Finds the story.** Picks the one turn the post exists to deliver and one running bit to pay off.
- **Writes in your voice.** A setup interview and your writing samples produce a private voice profile.
- **Keeps comedy alive while killing slop.** The anti-slop rules have two tiers. Hard bans cover things that are never funny (hidden gems, "a feast for the senses", "an experience you won't forget"). Fragments, groups of three, hyperbole, and em dashes are allowed when they do comedic work and cut when they are filler.
- **Never invents facts.** No made-up restaurants, prices, events, people, or quotes. Gaps become `[TODO: ...]`.
- **Never punches down.** The narrator is the idiot. The place is fine.

## Before and after

Notes: *"Took wrong ferry. 4 hours. Ate all my snacks. Sister was on the right ferry sending me pictures. Woman knitting. Bird."*

**Generic AI draft:**

> Embarking on a journey to the island is always an adventure, and my ferry ride was no exception! Whether you're a seasoned traveler or a first-timer, mishaps happen. It was an experience I won't soon forget.

**With the demo voice (Dot, a fictional narrator):**

> The ticket said "Pier 3." The ferry I boarded was at Pier 4. These are neighboring numbers, which is how I knew I was close to the right answer and also in the wrong country, spiritually.
>
> I ate the large snack I'd planned for the actual trip by the second hour, in a fit of grief. Bea, who had boarded the correct ferry and was texting me photos of a harbor, wrote: "How's the ocean?" It was fine. It was big. It was the most ocean I'd had access to, and I used none of it.

See `skills/misadventure-writer/example-voice/examples/` for three full demo posts.

## Install

### Claude Code: as a plugin

```
/plugin marketplace add umairadeeb/misadventure-writer
/plugin install misadventure-writer@misadventure-writer
```

### Claude Code: as a skill folder

```bash
git clone https://github.com/umairadeeb/misadventure-writer.git
mkdir -p ~/.claude/skills
ln -s "$(pwd)/misadventure-writer/skills/misadventure-writer" ~/.claude/skills/misadventure-writer
```

Copy instead of symlink if you prefer; a symlink picks up repo updates automatically.

### Claude.ai (upload a zip)

1. Run `./scripts/build-zip.sh`. It writes `dist/misadventure-writer.zip` with the skill only. Your private `voice/` folder is excluded.
2. In Claude.ai go to Settings, Capabilities, Skills, and upload the zip.
3. To use your own voice there, paste your voice profile into the chat and say "use this as my voice profile", or upload your voice files to a Project and mention it. The skill falls back to the demo voice otherwise.

## Set up your voice

Say: **"Set up my travel blog voice."**

Claude interviews you a few questions at a time (audience, who you read and who makes you cringe, what you make fun of yourself for, travel companions and boundaries, swearing level, length and structure, spelling, platform) and asks for 5 to 10 samples of your funniest writing. It analyzes them, writes `voice-profile.md`, and shows it to you for correction.

### Where your voice lives

The skill looks for a profile in this order and uses the first it finds:

1. `skills/misadventure-writer/voice/voice-profile.md` (gitignored, in the skill folder)
2. `~/.config/misadventure-writer/voice-profile.md` (user-level; survives plugin updates; **recommended**)
3. `skills/misadventure-writer/example-voice/voice-profile.md` (fictional demo)

If it falls back to the demo voice, it tells you once and offers setup. Nothing personal is ever written into a tracked file.

## Usage

- "Write a post about our trip to Slovenia. Here are my notes: ..."
- "Turn this voice note transcript into a funny blog post."
- "Make this draft funnier, but keep the facts."
- "Just write it" (skips the outline step)
- "Save this post as an example" (adds it to your private examples and updates your profile)

You get: a title with three alternates, an excerpt, tags, the post with `[PHOTO: ...]` markers, and a list of things to verify.

## Repo layout

```
.claude-plugin/        plugin + marketplace manifests
scripts/build-zip.sh   builds the claude.ai upload zip (no personal files)
skills/misadventure-writer/
  SKILL.md             workflow and core rules
  references/          humor playbook, anti-slop, travel craft, voice setup, output formats
  voice-template/      blank voice profile
  example-voice/       fictional demo voice and sample posts
  voice/               YOUR private voice (gitignored, not shipped)
```

## Contributing

Issues and pull requests are welcome, especially for new humor techniques, anti-slop patterns, and platform output formats. Rules for contributions:

- Keep SKILL.md under about 300 lines and references one level deep.
- Examples must be fictional or your own writing. No text from other authors.
- Never commit a real voice profile or real posts. The `.gitignore` covers `voice/`, but check `git status` before you push.
- Anything that punches down will not be merged.

## Credits and license

MIT licensed (see `LICENSE`). Ideas on anti-slop writing and blog workflows were drawn from several open-source projects; see `CREDITS.md`.
