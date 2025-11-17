
# Redmine Login Obfuscator

This **Redmine plugin** adds an additional layer of protection to your Redmine instance by returning a **random HTTP error code** on every failed login attempt. Instead of always responding with the same predictable status, the plugin chooses from the list: **401**, **403**, **407**, **410**.

This unpredictability helps *obfuscate authentication behavior*, making brute‑force attacks and credential‑stuffing attempts significantly harder for bots to analyze.

---

## Features

* Returns a **random HTTP status** on each failed login:
  `401`, `403`, `407`, or `410`.

* Makes it harder for bots and automated scanners to detect invalid credentials.

* Lightweight and effortless to use – just install, activate, and let it work invisibly in the background.

---

## How It Works

The plugin hooks into Redmine’s authentication flow.
Whenever a login attempt fails, it intercepts the response and replaces the default error code with one randomly selected from the predefined list.

Because different bots respond differently to various HTTP codes, this added randomness introduces ambiguity and slows down automated attacks — while still presenting a consistent experience to legitimate users.

---

## Installation

1. Clone or download this plugin into your Redmine installation:

   ```
   redmine_root/plugins/redmine_login_obfuscator
   ```

2. Run the necessary plugin setup commands (only if required for your environment):

   ```bash
   bundle install
   rake redmine:plugins:migrate RAILS_ENV=production
   ```

3. Restart Redmine (Passenger, Puma, Unicorn, or the entire web server, depending on your setup).

4. The protection activates immediately — **no configuration needed**.

---

## Why This Plugin Exists

I created this plugin after noticing a growing number of automated login attempts against a Redmine instance I manage.
Randomizing the HTTP responses on failed logins made it noticeably harder for bots to determine whether credentials were incorrect, ultimately reducing the volume of repeated attacks.

It’s a simple yet effective method to introduce unpredictability for attackers without impacting normal users.

---

## Project Home Page

> [https://plugins4.own.pl/redmine/login-obfuscator/](https://plugins4.own.pl/redmine/login-obfuscator/)

