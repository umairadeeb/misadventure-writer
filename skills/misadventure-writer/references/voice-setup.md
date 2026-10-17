# Voice Setup

Builds a private voice profile from an interview plus the user's own writing. Run it when the user asks to set up or redo their voice, or when no personal profile exists and they agree to set one up.

## Contents
1. Where files go (privacy first)
2. The interview
3. Collecting samples
4. Analyzing the samples
5. Writing the profile
6. Review with the user
7. Updating later

## 1. Where files go (privacy first)

Default location: `~/.config/misadventure-writer/`
- `voice-profile.md`
- `examples/` (the user's sample posts, one file each)

Why this location: it survives plugin updates and reinstalls, and it sits outside every git repository.

Alternative: `voice/` beside `SKILL.md` inside the skill folder. This is gitignored in this repo, but a plugin update or a re-clone can wipe it. Offer it only if the user prefers it. If they do, run `git status` afterwards and confirm nothing from it is tracked or staged.

Create the folder with `mkdir -p`. Never write profile contents into `example-voice/`, `voice-template/`, the README, or any tracked file.

Tell the user where the files went, in one sentence.

## 2. The interview

Ask a few questions at a time, not all at once. Wait for answers, then continue. Adapt: skip questions their answers already covered. Don't guess any answer. If something is unclear, ask.

**Round 1: audience and taste**
1. Who reads your blog: friends and family, strangers, other travelers, or a mix?
2. Which travel writers, comedians, or bloggers do you love? Which do you find cringe?
3. Which blogging platform do you publish to (Ghost, WordPress, Hugo, Substack, plain Markdown, something else)?

**Round 2: the narrator**
4. What do you usually make fun of yourself for when you travel? (Getting lost, packing, language fails, being cheap, being out of shape, tech obsession, overplanning, underplanning, something else.)
5. What kinds of jokes do you enjoy writing: dry understatement, rants, absurd comparisons, deadpan lists, something else?
6. Any pet phrases or recurring bits you already use?
7. British or American spelling?

**Round 3: people and boundaries**
8. Who travels with you, and are they allowed to be characters in your posts? Any nicknames to use? Anything off-limits about them?
9. What is off-limits overall, beyond the built-in rule of never punching down at locals, cultures, accents, religion, or poverty?
10. Swearing level: none, mild, or spicy?

**Round 4: shape of the posts**
11. How long is a typical post?
12. How do you like to structure it: chronological day-by-day, themed, listicle, one big story?
13. Do you want practical info (costs, tips, where you stayed) in your posts? If yes, where does it go and how should it sound?
14. How do you usually open a post? End one? Do you use a sign-off?

**Round 5: samples**
15. Ask for 5 to 10 samples. See below.

Do not ask for personal details beyond what the voice needs. Don't ask for home addresses, employers, family details, or anything not used in writing. If the user volunteers sensitive data, keep it out of the profile unless it's a writing rule.

## 3. Collecting samples

Ask for 5 to 10 pieces of funny writing the user is proud of. Accept:
- Links to blog posts (fetch only public pages the user pointed to)
- Pasted text
- Emails, group chat messages, photo captions, or reviews they wrote
- An export from their blog platform, if they offer one

If the user offers to give you API access to their blog platform, ask for read-only access, tell them exactly what you will read, and fetch only what is needed. Do not go looking for credentials. Never write, edit, or publish to their site during setup.

Save each sample as a separate file in `examples/`, named `YYYY-MM-DD-slug.md` (or `sample-N-slug.md` if undated). Keep the text as written, with minimal formatting.

If the samples are few, say so in the profile and mark confidence Low. A profile built on one sample overfits to it.

## 4. Analyzing the samples

Read all of them before writing anything. Then note, with exact quotes from the samples:

- **Sentence rhythm**: typical length, how often short sentences land, and how long the long ones run
- **Openings**: the first sentence of each post and what they have in common
- **Endings**: how they close
- **How jokes land**: where in the sentence the funny word goes, how callbacks work, how jokes are paced
- **Self-deprecating angles**: what the narrator is bad at, in the author's own framing
- **Recurring characters and bits**
- **Vocabulary used** (favorite words, slang, intensifiers) and **vocabulary never used** (what is conspicuously absent)
- **Punctuation habits**: dashes, parentheses, ellipses, exclamation marks, italics
- **Register**: formal or casual, contractions, swearing, direct address to the reader
- **Structure**: headings, lists, photo placement, length
- **Sincerity**: how and where they let a genuine moment in

Distinguish what you observe from what the user says. If the user says "I never use exclamation marks" and a sample has two, note both and ask.

Keep quotes short (a line or two each) and pick ones that show a pattern, not the best jokes.

## 5. Writing the profile

Use `voice-template/voice-profile.template.md` as the shape. Fill every section from the interview and samples. Where you have no information, write `Not specified` and ask. Do not fill gaps with plausible guesses.

Add a confidence note per section (High, Med, Low) based on sample size and consistency. Record the sample count and date.

## 6. Review with the user

Show the whole profile. Ask:
- What is wrong or missing?
- Which "never says" items did I miss?
- Is anything here too personal to be written down?

Apply corrections. Then write the final file to the private location and confirm the path. If the location is inside a git repository, run `git status` and report that no profile or sample files are tracked or staged.

## 7. Updating later

After the user approves a post, or corrects the voice, update the profile:
- Add new bans or favorite moves.
- Add a new running character or bit.
- Save the approved post into `examples/` and refresh the quoted examples if they now look dated.
- Tell the user what changed in one or two lines.

Keep a short "changelog" at the bottom of the profile with dates. Keep `examples/` to about 20 posts and ask before removing the oldest.
