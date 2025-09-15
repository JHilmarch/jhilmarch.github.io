---
layout: post
title: 'Vibe coding weekend'
date: 2025-09-15 23:55:00 +0200
categories: ai
---

# Vibe coding weekend

I know I'm late. People were using advanced prompting and language models for work a year ago. I followed the trend and
checked in once in a while, but using AI for programming never became a habit. That changed after I tried GitHub
[Copilot](https://github.com/features/copilot) and JetBrains' new AI agent, [Junie](https://www.jetbrains.com/junie/),
with [Model Context Protocol](https://github.com/modelcontextprotocol/) (MCP) servers plugged in. I'm hooked—I finally
understand the hype. These tools will speed up development many times over!

> TL;DR: I'm hooked—these tools are dramatically speeding up my work.

---

This weekend I had a **full-circle vibe-coding** session with GitHub Copilot and the GitHub MCP Server. I told Copilot
to make a plan and pointed out how I wanted the task solved. Then I asked it to create an issue in GitHub, come up with
a solution and open a pull request. After that I added the built-in Copilot as a reviewer and made some comments myself.
Copilot solved almost all recommended changes. I had to intervene once, deleting a line that the AI insisted on adding.
Impressed! But this was just a small detour from what I did this weekend. I also tried out the Azure DevOps MCP, let it
summarize all the coding conventions in the Team Wiki and make an `.editor` file from the result. Mostly, I was happy
getting Junie to work with the NixOS MCP server installed as a Nix package and the GitHub MCP server running in a Docker
container.

---

## Problems of the past

I remember the first time I tried ChatGPT as a sparring partner in a problem-solving session. I think it was version 3.5
or somewhere around there. As you probably remember, at that time the chat was not part of the IDE. I bought a
subscription for one or two months and used the chat in an open browser tab at the side. After a couple of hours I was
exhausted! It got stuck in loops where it didn't remember things we solved earlier. It made up stuff and sounded really
confident when it told me that the problem absolutely was not in a particular file. Of course, in the end I solved the
bug with a change in that file. ChatGPT distracted me and did more harm than good.

Some time later, I started using AI assistants with inline suggestions built into my IDE. I never liked that experience.
Whenever I began typing, a wall of text would pop up and derail my train of thought. I turned that feature off and
increasingly turned to the AI chat instead.

---

## Why now?

Why am I starting to use agents now and not earlier? I think it's a combination of:

- The tools have obviously become better over the summer
- A meetup with [SweNUG](https://sv.wikipedia.org/wiki/SweNUG) last Thursday with a great demonstration of tools and
  MCPs to get the AI agent vibe going
- JetBrains releasing the new AI Agent Junie
- Discussions with family and friends about running models locally and other setups related to programming

## Nothing is perfect!

Junie Pro (Beta) is great but could be better. Here are some notes I made while evaluating the agent:

> Note: Tightening repository guidelines can help keep outputs concise.

- Slow, even for simple solutions
- Has trouble staying in scope and often overdoes it. Asking for documentation yields a wall of text; better to keep to
  the core so it’s easier to digest. Probably, this can be solved by setting up tighter rules in the `guidelines.md`
  file.
- Hard to pause Junie to inject context when it’s reasoning poorly or taking an approach I don’t prefer.

---

## Let's not be naive

> Warning: I'm thinking of two clouds of worry—security and pricing.

Organizations need to discuss how employees can and are allowed to use the new tools. Is the information security policy
up to date, and is everyone following the rules?

Today we have affordable prices, but we know that AI companies lose money on every call we make. I think the cloud
suites for developers will have a price tag of at least 1300€ in a couple of years.

A solution to both the security and pricing issues will be to self-host some models and MCP servers or even run them
locally on your laptop.

---

## A promising future

The MCP I will get the most out of in the near term is the NixOS MCP. After long nights reading made-up bullshit
configurations, I'm looking forward to leaning back with a strict policy to never let the language models suggest Nix
solutions without searching for packages and options with the MCP first. I already pushed changes that we worked out
together with Junie.

_I have plans, and hopefully this will be a push forward for my ongoing projects._

---

**Disclaimer:** This blog post is co-written with AI 😉
