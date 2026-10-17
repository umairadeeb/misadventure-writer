# Output Formats

Default is clean Markdown. Use another format only when the voice profile's `Platform` field names one or the user asks.

## Contents
1. Default Markdown
2. Ghost
3. WordPress
4. Hugo / Jekyll / static sites
5. Photo markers
6. Verification list

## 1. Default Markdown

```
# Title

> Excerpt: one or two sentences.

Tags: tag-one, tag-two, tag-three

Alternative titles:
1. ...
2. ...
3. ...

---

Post body in Markdown. Use H2 for sections. No H1 inside the body.

[PHOTO: description of the photo that goes here]

---

To verify or fill in:
- [TODO: ...]
- Check: ...
```

Keep the helper parts (alternative titles, verification list) clearly separated from the post body so the user can paste the body alone.

## 2. Ghost

- Body in Markdown is accepted by Ghost's editor. Paste it directly.
- Provide fields separately: Title, Excerpt (Ghost "Custom excerpt", 300 characters max), Tags (comma-separated), and suggested feature-image caption.
- Use `[PHOTO: ...]` markers. Tell the user to replace each with an Image card.
- For galleries, suggest a Gallery card at that marker.
- If the user has a Ghost connector or API and wants you to create a draft, ask first. Create a draft only, never publish, and only after the user says yes in this conversation.

## 3. WordPress

- Provide Markdown that pastes into the block editor (headings and paragraphs convert cleanly).
- Provide fields separately: Title, Excerpt, Categories, Tags, Featured image suggestion with alt text.
- Offer plain HTML (`<h2>`, `<p>`, `<figure>`) if the user's editor is the classic one.
- Do not assume plugins (Yoast, etc.). Offer a meta description only if the user asks.

## 4. Hugo / Jekyll / static sites

Add front matter above the body. Hugo example:

```
---
title: "..."
date: YYYY-MM-DD
draft: true
tags: ["...", "..."]
summary: "..."
---
```

- Always `draft: true` unless the user says otherwise.
- Use the date the user gives you. If unknown, `[TODO: date]`.
- Use the platform's image shortcode only if the profile says which one. Otherwise keep `[PHOTO: ...]` markers.
- Match any front matter field names the user has in their examples.

## 5. Photo markers

- Format: `[PHOTO: short description]`, e.g. `[PHOTO: goat incident]`.
- Place them where a photo helps the joke or the scene, usually after the setup line and before the payoff.
- Don't describe photos you haven't been told about. If the user supplied captions, use them. If not, the marker describes the moment ("the ferry, departing"), not invented visual details.
- Offer alt text only on request.

## 6. Verification list

Close every delivery with a short list of what the user needs to check:
- Every `[TODO: ...]` left in the body
- Every number, name, and date to confirm against the original source
- Any detail taken from memory instead of the notes (should be none, but list `[VERIFY]` items)
- Anything you softened, left out, or changed in meaning, and why
- Any joke at a companion's expense they may want to clear first
